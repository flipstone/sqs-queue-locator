require "sqs-queue-locator/version"

module SQSQueueLocator
  def self.locate(options)
    name = queue_name(options)
    sqs = AWS::SQS.new
    sqs.queues.create name
  end

  def self.queue_name(options)
    if options[:env].to_s.empty?
      raise ArgumentError, ":env option in required for QueueLocator.queue_name"
    end

    if options[:queue].to_s.empty?
      raise ArgumentError, ":queue option in required for QueueLocator.queue_name"
    end

    "#{options[:env]}-#{options[:queue]}#{uniqifier(options[:env])}"
  end

  def self.uniqifier(env)
    if env == "development"
      "-#{Digest::MD5.hexdigest Socket.gethostname}"
    else
      ""
    end
  end
end
