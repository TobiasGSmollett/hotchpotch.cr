# See: https://github.com/crystal-lang/crystal/issues/403#issuecomment-332151459

class Object
  macro methods
    {{ @type.methods.map &.name.stringify }}
  end
end
