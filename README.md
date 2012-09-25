Simple Template Class

Compiles a template and a map of variables into finished string

Throws ArgumentError if you're template uses a variable not present in the data hash

The compile function is defined as a static method of the class, no instance is needed


Example:

<<<<<<< HEAD
```data     = { :day => 'Thursday', :name => 'Billy' }
template = ${name} has an appointment on ${day}
puts SimpleTemplate.compile data, template```
=======
`data     = { :day => 'Thursday', :name => 'Billy' }
template = ${name} has an appointment on ${day}
puts SimpleTemplate.compile data, template`
>>>>>>> 736bc14ba82cfe69d3a7fce2d3e23156fa57c327

output: Billy has an appointment on Thursday


You cannot nest string replacements, i.e.,

<<<<<<< HEAD
```data     = { :type => 'dog', :dog => 'Fido', :human => 'John' }
template = hello ${${type}}
puts SimpleTemplate.compile data, template```
=======
`data     = { :type => 'dog', :dog => 'Fido', :human => 'John' }
template = hello ${${type}}
puts SimpleTemplate.compile data, template`
>>>>>>> 736bc14ba82cfe69d3a7fce2d3e23156fa57c327

outputs: 'hello ${dog}' rather than 'hello Fido'


You can also escape a ${} replacement with a backslash like this:

<<<<<<< HEAD
```data     = { :buddy => 'Josh' }
template = hello \${buddy}
puts SimpleTemplate.compile data, template```
=======
`data     = { :buddy => 'Josh' }
template = hello \${buddy}
puts SimpleTemplate.compile data, template`
>>>>>>> 736bc14ba82cfe69d3a7fce2d3e23156fa57c327

outputs: 'hello ${buddy}' rather than 'hello \Josh'