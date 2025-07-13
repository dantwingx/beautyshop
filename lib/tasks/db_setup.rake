namespace :db do
  desc "Setup database with schema load and seed"
  task setup_production: :environment do
    puts "🔧 Setting up production database..."
    
    # Check connection
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      puts "✅ Database connection successful"
    rescue => e
      puts "❌ Database connection failed: #{e.message}"
      exit 1
    end
    
    # Load schema instead of running migrations
    puts "📦 Loading schema..."
    begin
      ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM shops")
      puts "⚠️  Tables already exist, skipping schema load"
    rescue
      puts "🏗️  Creating tables from schema..."
      Rake::Task["db:schema:load"].invoke
      puts "✅ Schema loaded successfully"
    end
    
    # Seed data
    puts "🌱 Seeding database..."
    Rake::Task["db:seed"].invoke
    
    # Show table count
    tables = ActiveRecord::Base.connection.tables - ['schema_migrations', 'ar_internal_metadata']
    puts "✅ Setup complete! Created #{tables.count} tables:"
    tables.each { |t| puts "  - #{t}" }
  end
end