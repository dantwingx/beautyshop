namespace :railway do
  desc "Railway deployment tasks"
  task deploy: :environment do
    puts "🚀 Railway deployment tasks starting..."
    
    # Assets precompile (if needed)
    if Rails.env.production?
      puts "📦 Precompiling assets..."
      Rake::Task['assets:precompile'].invoke
    end
    
    puts "✅ Railway deployment tasks completed"
  end
end