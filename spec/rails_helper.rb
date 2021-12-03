# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include Capybara::DSL
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def movie_data
  {:adult=>false,
 :backdrop_path=>"/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
 :belongs_to_collection=>nil,
 :budget=>63000000,
 :genres=>[{:id=>18, :name=>"Drama"}],
 :homepage=>"http://www.foxmovies.com/movies/fight-club",
 :id=>550,
 :imdb_id=>"tt0137523",
 :original_language=>"en",
 :original_title=>"Fight Club",
 :overview=>
  "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
 :popularity=>43.838,
 :poster_path=>"/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
 :production_companies=>
  [{:id=>508, :logo_path=>"/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png", :name=>"Regency Enterprises", :origin_country=>"US"},
   {:id=>711, :logo_path=>"/tEiIH5QesdheJmDAqQwvtN60727.png", :name=>"Fox 2000 Pictures", :origin_country=>"US"},
   {:id=>20555, :logo_path=>"/hD8yEGUBlHOcfHYbujp71vD8gZp.png", :name=>"Taurus Film", :origin_country=>"DE"},
   {:id=>54051, :logo_path=>nil, :name=>"Atman Entertainment", :origin_country=>""},
   {:id=>54052, :logo_path=>nil, :name=>"Knickerbocker Films", :origin_country=>"US"},
   {:id=>25, :logo_path=>"/qZCc1lty5FzX30aOCVRBLzaVmcp.png", :name=>"20th Century Fox", :origin_country=>"US"},
   {:id=>4700, :logo_path=>"/A32wmjrs9Psf4zw0uaixF0GXfxq.png", :name=>"The Linson Company", :origin_country=>"US"}],
 :production_countries=>[{:iso_3166_1=>"DE", :name=>"Germany"}, {:iso_3166_1=>"US", :name=>"United States of America"}],
 :release_date=>"1999-10-15",
 :revenue=>100853753,
 :runtime=>139,
 :spoken_languages=>[{:english_name=>"English", :iso_639_1=>"en", :name=>"English"}],
 :status=>"Released",
 :tagline=>"Mischief. Mayhem. Soap.",
 :title=>"Fight Club",
 :video=>false,
 :vote_average=>8.4,
 :vote_count=>22944}
end

def cast_data
  {:id=>550,
 :cast=>
  [{:adult=>false,
    :gender=>2,
    :id=>819,
    :known_for_department=>"Acting",
    :name=>"Edward Norton",
    :original_name=>"Edward Norton",
    :popularity=>10.82,
    :profile_path=>"/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
    :cast_id=>4,
    :character=>"The Narrator",
    :credit_id=>"52fe4250c3a36847f80149f3",
    :order=>0},
   {:adult=>false,
    :gender=>2,
    :id=>287,
    :known_for_department=>"Acting",
    :name=>"Brad Pitt",
    :original_name=>"Brad Pitt",
    :popularity=>16.376,
    :profile_path=>"/kPshtQm3uxAn8FmdyR453mJoMBD.jpg",
    :cast_id=>5,
    :character=>"Tyler Durden",
    :credit_id=>"52fe4250c3a36847f80149f7",
    :order=>1},
   {:adult=>false,
    :gender=>1,
    :id=>1283,
    :known_for_department=>"Acting",
    :name=>"Helena Bonham Carter",
    :original_name=>"Helena Bonham Carter",
    :popularity=>9.883,
    :profile_path=>"/DDeITcCpnBd0CkAIRPhggy9bt5.jpg",
    :cast_id=>6,
    :character=>"Marla Singer",
    :credit_id=>"52fe4250c3a36847f80149fb",
    :order=>2},
   {:adult=>false,
    :gender=>2,
    :id=>7470,
    :known_for_department=>"Acting",
    :name=>"Meat Loaf",
    :original_name=>"Meat Loaf",
    :popularity=>1.982,
    :profile_path=>"/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg",
    :cast_id=>7,
    :character=>"Robert \"Bob\" Paulson",
    :credit_id=>"52fe4250c3a36847f80149ff",
    :order=>3
    }]}
end

def review_data
  {:author=>"Goddard",
  :author_details=>{:name=>"", :username=>"Goddard", :avatar_path=>"/https://secure.gravatar.com/avatar/f248ec34f953bc62cafcbdd81fddd6b6.jpg", :rating=>nil},
  :content=>"Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.",
  :created_at=>"2018-06-09T17:51:53.359Z",
  :id=>"5b1c13b9c3a36848f2026384",
  :updated_at=>"2021-06-23T15:58:09.421Z",
  :url=>"https://www.themoviedb.org/review/5b1c13b9c3a36848f2026384"}
end