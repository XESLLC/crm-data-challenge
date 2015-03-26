require_relative '../data/crm'

def get_companies_array
  CRM[:companies]
end

def get_people_array
  CRM[:people]
end


def companies_and_employee_array
  person_array = []
  company_hash = {}
  final_array = []
  get_companies_array.each do |company|
    get_people_array.each do |person|
      if person[:employments]
      person[:employments].each do |employment|
        if employment[:company_id] == company[:id]
          person.delete(:employments)
          person_array << person
        end
      end
    end
    end
    company_hash[:name] = company[:name]
    company_hash[:employees] = person_array
    final_array << company_hash
  end
  puts "__________________"
  puts final_array
end

companies_and_employee_array
