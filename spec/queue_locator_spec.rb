require 'spec_helper'

describe SQSQueueLocator do
  describe "queue_name" do
    it "concatenates environment and name" do
      SQSQueueLocator.queue_name(
        env: "production",
        queue: "foo"
      ).should == "production-foo"
    end

    it "adds something special in development env" do
      name = SQSQueueLocator.queue_name env: "development", queue: "foo"
      name.should =~ /\Adevelopment-foo.*/
      name.length.should > "development-foo".length
      name.length.should <= 80
    end

    it "uniqifies development queues consistently on this same machine" do
      SQSQueueLocator.uniqifier("development").should ==
        SQSQueueLocator.uniqifier("development")
    end

    it "raises error if env is omitted" do
      -> do
        SQSQueueLocator.queue_name env: "", queue: "foo"
      end.should raise_error
    end

    it "raises error if queue is omitted" do
      -> do
        SQSQueueLocator.queue_name env: "production", queue: ""
      end.should raise_error
    end
  end
end

