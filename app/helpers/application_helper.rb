module ApplicationHelper
  def include_page_css(controller_name)
  	if (Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)).find_asset("#{controller_name}.scss")
  		stylesheet_link_tag controller_name
  	end
  end

  def include_page_js(controller_name)
    if (Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)).find_asset("#{controller_name}.js")
      javascript_include_tag controller_name
    end
  end

  def nav_bar_status(path)
  	current_page?(path) ? "active" : ""
  end 
  def flash_class_for(klass)
    case klass.to_sym
      when :success
        "success"
      when :notice
        "info"
      when :error
        "danger"
      when :warning
        "warning"
      else
        ""
      end
  end
end
