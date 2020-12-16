class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  enum sex: { "男性": 1, "女性": 2 ,"その他": 3},_suffix: true
  enum work: { "幼稚園教員": 4, "公立小学教員": 5 ,"私立小学教員": 6,"公立中学教員": 7,"私立中学教員": 8,"公立高校教員": 9,"私立高校教員": 10,"大学教員": 11,"塾講師": 12,"教材開発": 13,"学生": 14,"NPO団体": 15,"知育ゲームメーカー": 16,"事務職員": 17,"その他": 18},_suffix: true
  enum location: { "北海道": 19, "東北地方": 20 ,"関東地方": 21,"中部地方": 22,"近畿地方": 23,"中国地方": 24,"四国地方": 25,"九州地方": 26,"沖縄": 27,"その他": 28},_suffix: true
  enum annual: { "1年目": 29, "2-5年目": 30 ,"6-10年目": 31, "11-20年目": 32, "21-30年目": 33, "31年目以上": 34},_suffix: true
  enum subject: { "国語": 35,"算数・数学": 36,"理科": 37,"社会": 38,"音楽": 39,"技術": 40,"家庭科": 41,"体育": 42,"保険": 43,"その他": 44},_suffix: true
  enum club: { "なし": 45,"サッカー": 46,"野球": 47,"バスケットボール": 48,"テニス": 49,"卓球": 50,"陸上": 51,"バトミントン": 52,"ハンドボール": 53,"体操": 54,"水泳": 55,"柔道": 56,"剣道": 57,"弓道": 58,"茶道": 59,"美術": 60,"その他": 61},_suffix: true
  enum consalting: { "はい": 62,"いいえ": 63},_suffix: true




    validates :name, presence: true #追記
    validates :image, presence: true #追記
    validates :sex, presence: true #追記
    validates :work, presence: true #追記
    validates :location, presence: true #追記
    validates :annual, presence: true #追記
    validates :subject, presence: true #追記
    validates :club, presence: true #追記
    validates :consalting, presence: true #追記

#プロフィール画像
  mount_uploader :image, ImageUploader


#DM機能
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

#通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_many :rooms, through: :entries

mount_uploader :image, ImageUploader

end
