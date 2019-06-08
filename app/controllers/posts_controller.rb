# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @pa = <<~EOF
          ```ruby
          def haha
            a.ha
          end
          ```
          EOF
  end
end
