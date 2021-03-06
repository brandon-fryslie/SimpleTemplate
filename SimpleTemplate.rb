
# Brandon Fryslie
#
# 9/24/2012
#
# Rally Software Engineer Coding Excercises
#
# Excercie #5

# Simple Template Class
# 
# Compiles a template and a map of variables into finished string
# 
# Throws ArgumentError if the template uses a variable not present in the data hash
# 
# The compile function is defined as a static method of the class, no instance is needed


class SimpleTemplate

  def self.compile(data, tpl)

    # Globally replace matches
    tpl.gsub(/(^|[\s\S])\$\{(\w+)\}/) do |match|

      # Deal with escaped ${} by adding ${} around the regex match if \\ is detected
      next "${#{$2}}" if $1 == '\\'

      # Our key is the second element in the regex matches
      # Check if data is using Strings or Symbols and provide for that contingency
      if data.has_key?($2)
        key = $2
      elsif data.has_key?($2.to_sym)
        key = $2.to_sym
      else
        # Throw exception unless replacement is defined in data hash
        raise ArgumentError.new "Template replacement variable is undefined in data hash: #{key}"
      end

      $1 + data[key]

    end
  end
end
