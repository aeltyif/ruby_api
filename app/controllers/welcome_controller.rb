class WelcomeController < ApplicationController
  include Response

  def index
    json_response({
      'Welcome': 'This is my solution to the code challenge, below you can see the implemented functionality',
      'Implemented': {
        'Users': {
          'New': {'POST':'/auth'},
          'Sign In': {'POST':'/auth/sign_in'},
          'Applications': {'GET':'/applications'}
        },
        'Jobs': {
          'List': {'GET':'/jobs'},
          'Create': {'POST':'/jobs'},
          'Show': {'GET':'/jobs/:id'},
          'Update 1': {'PATCH':'/jobs/:id'},
          'Update 2': {'PUT':'/jobs/:id'},
          'Delete': {'DELETE':'/jobs/:id'}
        },
        'Applicant': {
          'List': {'GET':'/jobs/:job_id/applicants'},
          'Apply': {'POST':'/jobs/:job_id/applicants'},
          'Show': {'GET':'/jobs/:job_id/applicants/:id'}
        }
      }
    })
  end
end
