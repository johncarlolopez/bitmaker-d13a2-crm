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
    puts "\n --- Main Menu ---"
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search all attributes'
    puts '[6] Search by attribute'
    puts '[7] Exit'
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
        search_all
      when 6
        search_by_attribute
      when 7
        system exit
      else
    end
  end

  def add_new_contact
    puts "\n --- Create New Contact ---"
    print "Please enter first name:"
    first_name = gets.chomp
    print "Please enter last name:"
    last_name = gets.chomp
    print "Please enter email (optional):"
    email = gets.chomp
    print "Please enter notes (optional):"
    notes = gets.chomp
    Contact.create(first_name,last_name,email,notes)
    puts "\n --- Contact created ---"
  end

  def modify_existing_contact

  end

  def delete_contact

  end

  def display_all_contacts
    puts "\n --- All Contacts ---"
    Contact.all.each {|contact|
      show_contact(contact)
    }
  end

  def search_all
    puts "\n --- Search Contact ---"
    print "Please enter search criteria:"
    result = Contact.find(gets.chomp)
    puts "Results:"
    if result.class == Array
      result.each {|contact|
        show_contact(contact)
      }
    else
      show_contact(result)
    end
  end

  def search_by_attribute
    puts "\n --- Search by attribute ---"
    print "Please enter search criteria (first name,last name, email, id): "
    criteria = gets.chomp
    print "Please enter value you want to search (ex. \"john\",\"lopez\", \"john@gmail.com\", 1): "
    val = gets.chomp
    result = Contact.find_by(criteria,val)
    puts "Results:"
    if result.class == Array
      result.each {|contact|
        show_contact(contact)
      }
    else
      show_contact(result)
    end
  end

  def show_contact(contact)
    puts "#{contact.full_name.split.map(&:capitalize).join(' ')} | email:#{contact.email} | notes:#{contact.notes}"
  end

end

Contact.create("john","lopez","john@gmail.com","made this program")
Contact.create("dave","smith","dave@gmail.com")
Contact.create("charlize","lopez","charl@gmail.com")
Contact.create("bob","doel","bob@usa.gov")
Contact.create("lorem","ipsum","lee@latin.org")



CRM.new
