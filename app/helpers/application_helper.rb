module ApplicationHelper

  # def flash_class(level)
  #   case level.to_sym
  #   when :notice then "alert alert-success"
  #   when :success then "alert alert-success"
  #   when :error then "alert alert-danger"
  #   when :alert then "alert alert-danger"
  #   when :warning then "alert alert-warning"
  #   end
  # end
  # def flash_prefix(level)
  #   case level.to_sym
  #   when :notice then "Success!"
  #   when :success then "Success!"
  #   when :error then "Error!"
  #   when :alert then "Alert!"
  #   when :warning then "Warning!"
  #   end
  # end


  # def bootstrap_class_for flash_type
  #   { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  # end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-danger"
    else "alert-#{flash_type}"
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      puts msg_type
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def errors_for(object)
    if object.errors.any?

      content_tag(:div, class: "card border-danger") do
        concat(content_tag(:div, class: "card-header bg-danger text-white") do
          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
        end)
        concat(content_tag(:div, class: "card-body") do
          concat(content_tag(:ul, class: 'mb-0') do
            object.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end

  def gravatar_for(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

end
