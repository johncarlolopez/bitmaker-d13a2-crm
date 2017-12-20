require "./contact.rb"
require "pry"
class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts ' --- Main Menu ---'
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    print 'Enter a number: '
  end

  def call_option(opt = nil)
    # binding.pry
    case opt
      when 1
        add_new_contact
      when 2
        modify_existing_contact
      when 3
        delete_contact
      when 4
        display_all_contacts
      when 5
        search_by_attribute
      when 6
        system exit
      else
    end
  end

  def add_new_contact
    puts " --- Create New Contact ---"
    print "Please enter first name:"
    first_name = gets.chomp
    print "Please enter last name:"
    last_name = gets.chomp
    print "Please enter email (optional):"
    email = gets.chomp
    print "Please enter notes (optional):"
    notes = gets.chomp
    Contact.create(first_name,last_name,email,notes)
    puts " --- Contact created ---"
  end

  def modify_existing_contact

  end

  def delete_contact

  end

  def display_all_contacts
    puts " --- All Contacts ---"
    Contact.all.each {|contact|
      puts "#{contact.full_name.split.map(&:capitalize).join(' ')} | email:#{contact.email} | notes:#{contact.notes}"
    }
  end

  def search_by_attribute

  end


end

# john = Contact.create("john","lopez","john@gmail.com")
# dave = Contact.create("dave","smith","dave@gmail.com")
# charl = Contact.create("charl","lopez","charl@gmail.com")
CRM.new
