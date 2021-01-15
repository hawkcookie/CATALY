# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_105_120_534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'entries', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_entries_on_room_id'
    t.index ['user_id'], name: 'index_entries_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_messages_on_room_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.integer 'visitor_id', null: false
    t.integer 'visited_id', null: false
    t.integer 'post_id'
    t.integer 'message_id'
    t.integer 'room_id'
    t.string 'action', default: '', null: false
    t.boolean 'checked', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['message_id'], name: 'index_notifications_on_message_id'
    t.index ['post_id'], name: 'index_notifications_on_post_id'
    t.index ['visited_id'], name: 'index_notifications_on_visited_id'
    t.index ['visitor_id'], name: 'index_notifications_on_visitor_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.integer 'sex'
    t.integer 'work'
    t.string 'image'
    t.integer 'location'
    t.string 'contact'
    t.string 'uni'
    t.text 'free'
    t.integer 'annual'
    t.integer 'club'
    t.integer 'subject'
    t.text 'free_profile'
    t.integer 'consalting'
    t.integer 'position'
    t.boolean 'send_mail', default: true, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'entries', 'rooms'
  add_foreign_key 'entries', 'users'
  add_foreign_key 'messages', 'rooms'
  add_foreign_key 'messages', 'users'
end
