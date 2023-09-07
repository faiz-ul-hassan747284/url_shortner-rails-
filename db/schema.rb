# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_07_155856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytics", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config", null: false
  end

  create_table "apiKeys", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "key", null: false
    t.string "expiration", limit: 255, null: false
    t.boolean "isRevoked", default: false, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
  end

  create_table "assetData", id: :integer, default: nil, force: :cascade do |t|
    t.binary "data", null: false
  end

  create_table "assetFolders", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "slug", limit: 255, null: false
    t.integer "parentId"
  end

  create_table "assets", id: :serial, force: :cascade do |t|
    t.string "filename", limit: 255, null: false
    t.string "hash", limit: 255, null: false
    t.string "ext", limit: 255, null: false
    t.text "kind", default: "binary", null: false
    t.string "mime", limit: 255, default: "application/octet-stream", null: false
    t.integer "fileSize", comment: "In kilobytes"
    t.json "metadata"
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
    t.integer "folderId"
    t.integer "authorId"
  end

  create_table "authentication", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config", null: false
    t.boolean "selfRegistration", default: false, null: false
    t.json "domainWhitelist", null: false
    t.json "autoEnrollGroups", null: false
    t.integer "order", default: 0, null: false
    t.string "strategyKey", limit: 255, default: "", null: false
    t.string "displayName", limit: 255, default: "", null: false
  end

  create_table "brute", id: false, force: :cascade do |t|
    t.string "key", limit: 255
    t.bigint "firstRequest"
    t.bigint "lastRequest"
    t.bigint "lifetime"
    t.integer "count"
  end

  create_table "clicks", force: :cascade do |t|
    t.bigint "url_id"
    t.string "platform"
    t.string "browser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url_id"], name: "index_clicks_on_url_id"
  end

  create_table "commentProviders", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "content", null: false
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
    t.integer "pageId"
    t.integer "authorId"
    t.text "render", default: "", null: false
    t.string "name", limit: 255, default: "", null: false
    t.string "email", limit: 255, default: "", null: false
    t.string "ip", limit: 255, default: "", null: false
    t.integer "replyTo", default: 0, null: false
  end

  create_table "editors", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.json "permissions", null: false
    t.json "pageRules", null: false
    t.boolean "isSystem", default: false, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
    t.string "redirectOnLogin", limit: 255, default: "/", null: false
  end

  create_table "locales", primary_key: "code", id: :string, limit: 5, force: :cascade do |t|
    t.json "strings"
    t.boolean "isRTL", default: false, null: false
    t.string "name", limit: 255, null: false
    t.string "nativeName", limit: 255, null: false
    t.integer "availability", default: 0, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
  end

  create_table "loggers", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.string "level", limit: 255, default: "warn", null: false
    t.json "config"
  end

  create_table "migrations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "batch"
    t.datetime "migration_time"
  end

  create_table "migrations_lock", primary_key: "index", id: :serial, force: :cascade do |t|
    t.integer "is_locked"
  end

  create_table "navigation", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.json "config"
  end

  create_table "pageHistory", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.string "hash", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.string "description", limit: 255
    t.boolean "isPrivate", default: false, null: false
    t.boolean "isPublished", default: false, null: false
    t.string "publishStartDate", limit: 255
    t.string "publishEndDate", limit: 255
    t.string "action", limit: 255, default: "updated"
    t.integer "pageId"
    t.text "content"
    t.string "contentType", limit: 255, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "editorKey", limit: 255
    t.string "localeCode", limit: 5
    t.integer "authorId"
    t.string "versionDate", limit: 255, default: "", null: false
    t.json "extra", default: {}, null: false
  end

  create_table "pageHistoryTags", id: :serial, force: :cascade do |t|
    t.integer "pageId"
    t.integer "tagId"
  end

  create_table "pageLinks", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.string "localeCode", limit: 5, null: false
    t.integer "pageId"
    t.index ["path", "localeCode"], name: "pagelinks_path_localecode_index"
  end

  create_table "pageTags", id: :serial, force: :cascade do |t|
    t.integer "pageId"
    t.integer "tagId"
  end

  create_table "pageTree", id: :integer, default: nil, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.integer "depth", null: false
    t.string "title", limit: 255, null: false
    t.boolean "isPrivate", default: false, null: false
    t.boolean "isFolder", default: false, null: false
    t.string "privateNS", limit: 255
    t.integer "parent"
    t.integer "pageId"
    t.string "localeCode", limit: 5
    t.json "ancestors"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.string "hash", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.string "description", limit: 255
    t.boolean "isPrivate", default: false, null: false
    t.boolean "isPublished", default: false, null: false
    t.string "privateNS", limit: 255
    t.string "publishStartDate", limit: 255
    t.string "publishEndDate", limit: 255
    t.text "content"
    t.text "render"
    t.json "toc"
    t.string "contentType", limit: 255, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
    t.string "editorKey", limit: 255
    t.string "localeCode", limit: 5
    t.integer "authorId"
    t.integer "creatorId"
    t.json "extra", default: {}, null: false
  end

  create_table "renderers", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config"
  end

  create_table "searchEngines", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.json "config"
  end

  create_table "sessions", primary_key: "sid", id: :string, limit: 255, force: :cascade do |t|
    t.json "sess", null: false
    t.datetime "expired", null: false
    t.index ["expired"], name: "sessions_expired_index"
  end

  create_table "settings", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.json "value"
    t.string "updatedAt", limit: 255, null: false
  end

  create_table "storage", primary_key: "key", id: :string, limit: 255, force: :cascade do |t|
    t.boolean "isEnabled", default: false, null: false
    t.string "mode", limit: 255, default: "push", null: false
    t.json "config"
    t.string "syncInterval", limit: 255
    t.json "state"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "tag", limit: 255, null: false
    t.string "title", limit: 255
    t.string "createdAt", limit: 255, null: false
    t.string "updatedAt", limit: 255, null: false
    t.index ["tag"], name: "tags_tag_unique", unique: true
  end

  create_table "urls", force: :cascade do |t|
    t.string "url"
    t.string "shortened_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "userAvatars", id: :integer, default: nil, force: :cascade do |t|
    t.binary "data", null: false
  end

  create_table "userGroups", id: :serial, force: :cascade do |t|
    t.integer "userId"
    t.integer "groupId"
  end

  create_table "userKeys", id: :serial, force: :cascade do |t|
    t.string "kind", limit: 255, null: false
    t.string "token", limit: 255, null: false
    t.string "createdAt", limit: 255, null: false
    t.string "validUntil", limit: 255, null: false
    t.integer "userId"
  end

  add_foreign_key "assetFolders", "\"assetFolders\"", column: "parentId", name: "assetfolders_parentid_foreign"
  add_foreign_key "assets", "\"assetFolders\"", column: "folderId", name: "assets_folderid_foreign"
  add_foreign_key "comments", "pages", column: "pageId", name: "comments_pageid_foreign"
  add_foreign_key "pageHistory", "editors", column: "editorKey", primary_key: "key", name: "pagehistory_editorkey_foreign"
  add_foreign_key "pageHistory", "locales", column: "localeCode", primary_key: "code", name: "pagehistory_localecode_foreign"
  add_foreign_key "pageHistoryTags", "\"pageHistory\"", column: "pageId", name: "pagehistorytags_pageid_foreign", on_delete: :cascade
  add_foreign_key "pageHistoryTags", "tags", column: "tagId", name: "pagehistorytags_tagid_foreign", on_delete: :cascade
  add_foreign_key "pageLinks", "pages", column: "pageId", name: "pagelinks_pageid_foreign", on_delete: :cascade
  add_foreign_key "pageTags", "pages", column: "pageId", name: "pagetags_pageid_foreign", on_delete: :cascade
  add_foreign_key "pageTags", "tags", column: "tagId", name: "pagetags_tagid_foreign", on_delete: :cascade
  add_foreign_key "pageTree", "\"pageTree\"", column: "parent", name: "pagetree_parent_foreign", on_delete: :cascade
  add_foreign_key "pageTree", "locales", column: "localeCode", primary_key: "code", name: "pagetree_localecode_foreign"
  add_foreign_key "pageTree", "pages", column: "pageId", name: "pagetree_pageid_foreign", on_delete: :cascade
  add_foreign_key "pages", "editors", column: "editorKey", primary_key: "key", name: "pages_editorkey_foreign"
  add_foreign_key "pages", "locales", column: "localeCode", primary_key: "code", name: "pages_localecode_foreign"
  add_foreign_key "userGroups", "groups", column: "groupId", name: "usergroups_groupid_foreign", on_delete: :cascade
end
