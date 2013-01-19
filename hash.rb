def set_add_el(hash, key)
  hash[key] = true unless hash[key]
  hash
end

def set_remove_el(hash, key)
  hash.delete(key)
  hash
end

def set_list_els(hash)
  hash.keys
end

def set_member?(hash, key)
  hash.include?(key)
end

def set_union(hash1, hash2)
  hash1.merge(hash2)
end

def set_intersection(hash1, hash2)
  hash1.select { |k,v| hash2.include?(k) }
end

def set_minus(hash1, hash2)
  hash1.delete_if { |k,v| hash2.include?(k) }
end