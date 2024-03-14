class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_users
  has_many :events, through: :event_users
  has_many :items, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_items, through: :favourites, source: :item
  geocoded_by :location, if: :present?
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo

  ARTISANS = [
    "Sol y Seda",
    "Jade Blossom",
    "Millefiori",
    "Sartoria Cavour",
    "La Bottega dell'artigiano",
    "Design of the Nile",
  ]

  DESCRIPTIONS = [
    "Step into the enchanting world of jewelry making, where each piece is a manifestation of creativity and precision. Our artisans meticulously select the finest gemstones and metals, infusing each design with elegance and allure. From delicate necklaces that whisper of romance to bold statement earrings that command attention, every creation is a testament to the artistry and craftsmanship that goes into handcrafting timeless treasures. With each piece carefully crafted by skilled hands, our jewelry transcends mere adornment, becoming cherished heirlooms that tell stories of love, passion, and exquisite beauty.",
    "Embark on a journey into the realm of shoemaking, where tradition meets innovation in every stitch and sole. Our artisans, steeped in centuries-old techniques, bring passion and expertise to the craft, creating footwear that blends style with unparalleled comfort. From luxurious leather loafers to artisanal boots handcrafted with care, each pair is a masterpiece of design and functionality. With meticulous attention to detail, our shoemakers ensure that every shoe not only fits like a glove but also reflects the individuality and sophistication of its wearer. Step into a world where craftsmanship reigns supreme, and every step is a testament to timeless elegance and superior quality.",
    "Dive into a tapestry of colors, patterns, and traditions with our exquisite collection of ethnic clothes. Each garment is a celebration of cultural heritage and artisanal skill, meticulously crafted by masterful hands using time-honored techniques passed down through generations. From intricately embroidered sarees that shimmer with threads of gold to vibrant kaftans adorned with ancient motifs, our collection transports you to distant lands and evokes a sense of wanderlust and wonder. With a deep reverence for craftsmanship and a commitment to preserving cultural legacies, our artisans weave stories of identity and belonging into every stitch, creating garments that are as rich in history as they are in beauty.",
    "Enter the realm of high fashion, where creativity knows no bounds and innovation reigns supreme. Our designers, visionaries in their own right, push the boundaries of style with every collection, blending cutting-edge trends with timeless elegance to create garments that are as bold as they are beautiful. From runway-ready dresses that dazzle with intricate embellishments to sleek tailored suits that exude confidence and sophistication, each piece is a masterpiece of design and craftsmanship. With an unwavering commitment to quality and attention to detail, our fashion artisans ensure that every garment not only looks stunning but also feels exquisite to wear, empowering you to express yourself with confidence and style.",
    "Immerse yourself in a world of effortless glamour and refined sophistication with our curated collection of fashion essentials. Inspired by the timeless allure of classic design and infused with a modern twist, our garments are meticulously crafted to elevate your everyday style. From luxurious cashmere sweaters that cocoon you in warmth and comfort to impeccably tailored trousers that epitomize understated elegance, each piece is a testament to the artistry and craftsmanship that defines our brand. With an unwavering commitment to quality and attention to detail, our fashion artisans ensure that every garment not only looks impeccable but also feels luxurious to wear, allowing you to embrace your individuality with grace and confidence.",
    "Explore the intersection of art and style with our collection of fashion-forward designs that push the boundaries of creativity and expression. From avant-garde silhouettes that challenge convention to bold prints and textures that make a statement, each piece is a work of art in its own right, meticulously crafted by skilled artisans who are passionate about their craft. Whether you're drawn to sleek minimalism or bold maximalism, our collection offers something for every taste and occasion. With a focus on innovation and quality, our fashion artisans blend traditional techniques with modern aesthetics to create garments that are as unique and dynamic as the individuals who wear them.",
  ]

  ADDRESSES = [
    "Via della Vigna Nuova, 50123 Firenze FI, Italy",
    "Calle de la Plaza, Madrid, 28001, Spain",
    "Carrer del Bruc, L'Eixample, 08037 Barcelona, Spain",
    "Rue de la Paix, Paris, 75002, France",
    "Avenue des Arts, Brussels, 1000, Belgium",
    "Via Della Spiga, 20121 Milano MI, Italy",
  ]
end
