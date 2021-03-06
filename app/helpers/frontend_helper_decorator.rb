module Spree
  module FrontendHelper
    def flash_messages(opts = {})
      ignore_types = ["order_completed"].concat(Array(opts[:ignore_types]).map(&:to_s) || [])

      flash.each do |msg_type, text|
        unless ignore_types.include?(msg_type)
          concat(content_tag :div, text, class: "alert-dismissable alert-hide alert alert-#{msg_type}", 'data-dismiss': 'alert')
        end
      end
      nil
    end
  end
end
