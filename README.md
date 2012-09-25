Simple Template Class

Compiles a template and a map of variables into finished string

Throws ArgumentError if you're template uses a variable not present in the data hash

The compile function is defined as a static method of the class, no instance is needed


Example:

`data     = { :day => 'Thursday', :name => 'Billy' }
template = ${name} has an appointment on ${day}
puts SimpleTemplate.compile data, template`

output: Billy has an appointment on Thursday


You cannot nest string replacements, i.e.,

`data     = { :type => 'dog', :dog => 'Fido', :human => 'John' }
template = hello ${${type}}
puts SimpleTemplate.compile data, template`

outputs: 'hello ${dog}' rather than 'hello Fido'


You can also escape a ${} replacement with a backslash like this:

`data     = { :buddy => 'Josh' }
template = hello \${buddy}
puts SimpleTemplate.compile data, template`

outputs: 'hello ${buddy}' rather than 'hello \Josh'