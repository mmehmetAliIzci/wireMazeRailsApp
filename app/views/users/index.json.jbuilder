json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :name, :address, :post_code, :contact, :personal_page, :birthday, :id_number, :presentation, :habits, :experience, :type, :active
  json.url user_url(user, format: :json)
end
