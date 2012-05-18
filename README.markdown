SQS Queue Locator
=================

Amazon SQS queue names need to be unique at the account level.                    
This gem implements a simple naming convention of <environment>-<queue-name> to   
allow your app to have keep track of queues per environment.                      
                                                                                   
For the development environment, an extra prefix is added based on your machine's 
hostname so that multiple developers can work at the same time without stepping   
on each others' queues.

Usage
-----

in your Gemfile:

    gem 'sqs-queue-locator'

Somewhere in your app's initialization:

    AWS.config :access_key_id => YOUR_ACCESS_KEY_ID,
               :secret_access_key => YOUR_SECRET_ACCESS_KEY

Where you need to locate the queue:

    queue = SQSQueueLocator.locate :env => Rails.env,
                                   :queue => 'your-queue-name'
                                  
Note: Locate will create the queue if it doesn't exist, or return a reference to
the existing queue.
