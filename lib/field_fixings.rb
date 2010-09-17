module FieldFixings
  def camel_case(*getter_method_names)
    getter_method_names.each do |getter|
      define_method getter.to_sym do
        instance_variable_get("@#{getter}").upcase.titleize
      end
    end
  end

  def upper_case(*getter_method_names)
    getter_method_names.each do |getter|
      define_method getter.to_sym do
        instance_variable_get("@#{getter}").upcase
      end
    end
  end
end