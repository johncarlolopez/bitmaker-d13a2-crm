require "pry"
# Contact class
class Contact
  # Class variables
  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email = '', note = '')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # Readers
  def first_name
    return @first_name
  end

  def last_name
    return @last_name
  end

  def email
    return @email
  end

  def notes
    return @notes
  end

  def id
    return @id
  end

  # Writers
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def notes=(notes)
    @notes = notes
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name,last_name,email ='',notes = '')
    new_contact = Contact.new(first_name,last_name,email,notes)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(criteria)
    matches = []
    # binding.pry
    if criteria.class == String
      @@contacts.each {|contact|
        if contact.full_name.include?(criteria)
          matches << contact
        elsif contact.email == criteria
          matches << contact
        end
      }
    elsif criteria.class == Integer
      @@contacts.each {|contact|
        if contact.id == criteria
          matches << contact
        end
      }
    end
    if matches.count == 1
      return matches.first
    elsif matches.count == 0
      return nil
    else
      return matches
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,val)
    case attribute
      when "first_name"
        self.first_name = val
      when "last_name"
        self.last_name = val
      when "email"
        self.email = val
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by()

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end


  def self.delete(criteria)
    matches = []
    # binding.pry
    if criteria.class == String
      @@contacts.each {|contact|
        if contact.full_name.include?(criteria)
          matches << contact
          contact.delete
        elsif contact.email == criteria
          matches << contact
          contact.delete
        end
      }
    elsif criteria.class == Integer
      @@contacts.each {|contact|
        if contact.id == criteria
          matches << contact
          contact.delete
        end
      }
    end
    if matches.count == 1
      return matches.first
    elsif matches.count == 0
      return nil
    else
      return matches
    end
  end

  # Feel free to add other methods here, if you need them.

end


john = Contact.create("john","lopez","john@gmail.com")
dave = Contact.create("dave","smith","dave@gmail.com")
charl = Contact.create("charl","lopez","charl@gmail.com")

# p Contact.all

# p charl.full_name
# p Contact.find("charl")
# puts "find:"
# p Contact.find("lopez")
# p Contact.find("lul")

# p Contact.delete("charl")
# p Contact.all

# charl.update("first_name","charle")
# p charl.first_name
