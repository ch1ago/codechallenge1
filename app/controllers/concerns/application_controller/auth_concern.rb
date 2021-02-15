class ApplicationController < ActionController::Base
  module AuthConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_org
    end

    class_methods do
      def signed_out!(*args)
        before_action(*args) { redirect_to :home if current_org.present? }
      end

      def signed_in!(*args)
        before_action(*args) { redirect_to :auth if current_org.blank? }
      end
    end

    def current_org
      @current_org ||= get_current_org
    end

    def get_current_org
      org_id = session[:org_id]
      return nil if org_id.blank?

      Org.find(session[:org_id])
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def set_current_org(org)
      @current_org = nil
      session[:org_id] = org&.id
    end
  end
end
