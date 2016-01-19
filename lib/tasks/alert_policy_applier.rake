require_relative '../policy_applier'

namespace :alerting do
  task :policy_applier => :environment do
    loop do
      PolicyApplier.run(5)
    end

  end
end
