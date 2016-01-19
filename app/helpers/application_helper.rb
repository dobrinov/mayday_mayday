module ApplicationHelper
  def name_for_condition_type(type)
    case type.new
    when ValueCondition
      'Value'
    when PercentileCondition
      'Percentile'
    when ExpirationCondition
      'Expiration'
    when ExistanceCondition
      'Existance'
    else
      "Type #{type} not defined."
    end
  end

  def description_for_condition(condition)
    case condition.type
    when 'ValueCondition'
      "Alert if
      #{content_tag(:strong, "#{condition.layer}.#{condition.name}")}
      goes #{condition.inverted ? 'below' : 'over'}
      #{content_tag(:strong, condition.value)}
      ".html_safe
    when 'PercentileCondition'
      'Not implemented'
    when 'ExpirationCondition'
      'Not implemented'
    when 'ExistanceCondition'
      'Not implemented'
    else
      raise "Type #{condition.type} not defined."
    end
  end
end
