namespace :pg do
  desc "TODO"
  task transaction: :environment do
    ActiveRecord::Base.transaction do
      u = User.find_by(name: 'foo')
      u.update(name: 'bar')

      ActiveRecord::Base.connection.execute 'TRUNCATE TABLE users'

      u = User.new(name: 'another foo')
      u.save

      binding.pry
    end
  end

  task setup: :environment do
    u = User.delete_all
    u = User.create(name: 'foo')
  end
end
