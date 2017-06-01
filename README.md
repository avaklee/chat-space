== README

# Made Models for User, Message, Group, and Group_user

# Message Table 
    create_table :messages do |t|
      t.text :body, null: false
      t.string :image, null: false
      t.integer :group_id
      t.integer :user_id
      t.timestamps

# Group Table
      create_table :groups do |t|
      t.string :name, null: false, unique: true
      t.timestamps

# Group_user Table
    create_table :group_users do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps

# User Table - created using by DEVISE GEM
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps null: false


# Association Made

   # Group.rb
  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users
  has_many :messages

   # User.rb
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :messages

   # Message.rb
  belongs_to :user
  belongs_to :group

   #  Group_user.rb
  belongs_to :user
  belongs_to :group





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
