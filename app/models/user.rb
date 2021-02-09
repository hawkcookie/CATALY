class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: { "男性": 1, "女性": 2 ,"その他": 3},_suffix: true
  enum work: { "幼稚園教員": 4, "保育園教員": 5,"公立小学教員": 6 ,"私立小学教員": 7,"公立中学教員": 8,"私立中学教員": 9,"公立高校教員": 10,"私立高校教員": 11,"大学教員": 12,"塾講師": 13,"学生": 14,"NPO団体職員": 15,"会社員": 16,"事務職員": 17,"その他": 18},_suffix: true
  enum location: { "北海道": 20, "青森": 21,"岩手": 22,"宮城": 23,"秋田": 24,"山形": 25,"福島": 26,"茨城": 27,"栃木": 28,"群馬": 29,"埼玉": 30,"千葉": 31,"東京": 32,"神奈川": 33,"新潟": 34,"富山": 35,"石川": 36,"福井": 37,"山梨": 38,"長野": 39,"岐阜": 40,"静岡": 41,"愛知": 42,"三重": 43,"滋賀": 44,"京都": 45,"大阪": 46,"兵庫": 47,"奈良": 48,"和歌山": 49,"鳥取": 50,"岡山": 51,"広島": 52,"山口": 53,"徳島": 54,"香川": 55,"愛媛": 56,"高知": 57,"福岡": 58,"佐賀": 59,"長崎": 60,"熊本": 61,"大分": 62,"宮崎": 63,"鹿児島": 64,"沖縄": 65,"海外": 66},_suffix: true
  enum annual: { "0年目（学生）": 68,"1年目": 69, "2-5年目": 70 ,"6-10年目": 71, "11-20年目": 72, "21-30年目": 73, "31年目以上": 74},_suffix: true
  enum subject: { "国語": 75,"算数・数学": 76,"理科": 77,"社会": 78,"音楽": 79,"技術": 80,"家庭科": 81,"体育": 82,"保健": 83,"なし（小学校教員など）": 84,"その他（特別支援など）": 85},_suffix: true
  enum club: { "なし": 86,"サッカー": 87,"野球": 88,"バスケットボール": 89,"テニス": 90,"卓球": 91,"陸上": 92,"バトミントン": 93,"ハンドボール": 94,"体操": 95,"水泳": 96,"柔道": 97,"剣道": 98,"弓道": 99,"茶道": 100,"美術": 101,"書道": 102,"合唱": 103,"吹奏楽": 104,"その他": 105},_suffix: true
  enum consalting: { "する": 106,"しない": 107},_suffix: true
  enum position:{ "校長": 108,"副校長": 109,"教頭": 110,"教務部": 111,"生徒指導部": 112,"進路指導部": 113,"保健安全指導部": 114,"総務部": 115,"教育相談部": 116,"生活指導部": 117,"その他": 118},_suffix: true



    validates :name, presence: true #追記
    validates :image, presence: true #追記
    validates :sex, presence: true #追記
    validates :work, presence: true #追記
    validates :location, presence: true #追記
    validates :annual, presence: true #追記
    validates :subject, presence: true #追記
    validates :club, presence: true #追記
    validates :consalting, presence: true #追記
    validates :position, presence: true #追記

#プロフィール画像
  mount_uploader :image, ImageUploader, dependent: :destroy

  # DM機能
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_many :rooms, through: :entries, dependent: :destroy

  mount_uploader :image, ImageUploader, dependent: :destroy
end
