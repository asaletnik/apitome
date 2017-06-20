module Apitome::DocsHelper
  def param_name(param)
    return param_name_scoped(param) if param['scope']
    return param_name_indented(param) if param['indentation_level']
    param['name']
  end

  def param_name_scoped(param)
    "#{format_scope(param['scope'])}[#{param['name']}]"
  end
  def format_scope(scope)
    Array(scope).each_with_index.map do |scope, index|
      if index == 0
        scope
      else
        "[#{scope}]"
      end
    end.join
  end

  def param_name_indented(param)
    "#{"&nbsp;&nbsp;&nbsp;"*param['indentation_level'].to_i}#{param['name']}".html_safe
  end

  def resource_link(resource)
    "#{Apitome.configuration.mount_at}/#{resource['examples'].first['link'].gsub(/\.json$/, '')}"
  end

  def example_link(example)
    "#{Apitome.configuration.mount_at}/#{example['link'].gsub(/\.json$/, '')}"
  end

  def link_active?(link)
    current_page?(url_for(link))
  end
end
