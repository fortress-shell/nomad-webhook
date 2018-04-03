module NomadWebhook::Processor
  extend ActiveSupport::Concern

  NOMAD_EVENTS_WHITELIST = %w(
    terminated
    started
    killed
  )

  def create
    if self.respond_to?(event_method, true)
      @result = self.send event_method
      head :bad_request unless @result.success?
    else
      head :ok
    end
  end

  private

  def event_method
    @event_method ||= "nomad_#{nomad_task_event_type}".to_sym
  end

  def nomad_task_event_type
    params[:TaskEvent][:Type].split(' ').join('_').underscore
  end
end
