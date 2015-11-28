require 'yaml'
require 'json'
require 'socket'
require "activerecord-import"

require_relative '../app/models/measurement'

class TcpMetricServer

  BULK_IMPORT_PACKAGE_SIZE = 300

  def initialize(port)
    @server = TCPServer.new(port)

    @measurements_processed_interval = 0
    @measurements_batch = []
  end

  def start
    start_counter
    start_measurement_listener
  end

  private

  def start_counter
    Thread.new do
      loop do
        puts "#{@measurements_processed_interval} events/s"
        @measurements_processed_interval = 0
        sleep 1
      end
    end
  end

  def start_measurement_listener
    loop do
      Thread.start(@server.accept) do |client|
        while payload = client.gets
          process_payload(payload, BULK_IMPORT_PACKAGE_SIZE)
        end

        client.close
      end
    end
  end

  def process_payload(payload, batch_size)
    begin
      measurement = parse_payload(payload)

      @measurements_batch.push(measurement.values)

      if @measurements_batch.count >= batch_size
        @measurements_processed_interval += batch_size
        Measurement.import(measurement_column_names, @measurements_batch)
        @measurements_batch.clear
      end
    rescue => e
      puts e.message
      puts e.backtrace
    end
  end

  def parse_payload(payload)
    measurement = JSON.parse(payload)
    measurement['created_at'] = Time.at(measurement.delete('timestamp'))

    measurement
  end

  def measurement_column_names
    @_measurement_column_names ||= Measurement.attribute_names - %w{id created_at updated_at}
  end
end
