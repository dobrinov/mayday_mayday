class PolicyApplier
  def self.run(run_interval)
    PolicyApplier.new(run_interval).run
  end

  def initialize(run_interval)
    @run_interval = run_interval
  end

  def run
    loop do
      Policy.all.each do |policy|
        puts '####################################'
        puts "# #{policy.name}"
        puts '####################################'

        incident = policy.incidents.where(resolved_at: nil).last

        if policy.violated?
          if incident.present?
            puts "Incident already exists. Skipping ..."
            incident.update(last_available_at: Time.now)
          else
            puts "Creating incident ..."
            policy.incidents.create!(last_available_at: Time.now)
          end
        else
          if incident.present?
            puts "Resolving incident ..."
            incident.update(resolved_at: Time.now)
          else
            puts "No violations detected ..."
          end
        end

        puts ''
      end

      sleep @run_interval
    end
  end
end
