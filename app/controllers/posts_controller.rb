# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @pa = <<~EOF
          ```ruby
          def haha
            a.ha
          end
          # frozen_string_literal: true

          class ApplicationController < ActionController::Base
            include MarkdownHelper
          end
          ```
          EOF
  end
end
