class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  TITLES = [
    "Chic Threads Emporium",
    "Gemstone Gallery Market",
    "Crafted Creations Bazaar",
    "Fashionista Finds Fair",
    "Luxury Leather Lane",
    "Boutique Bling Bazaar",
    "Stylish Stitches Showcase",
    "Jewel Junction Market",
    "Leather Luxe Marketplace",
    "Trendy Treasures Plaza",
    "Glamour Grove Market",
    "Leather & Lace Boutique",
  ]

  DESCRIPTIONS = [
    "Step into the world of haute couture at Chic Threads Emporium, where fashion meets sophistication. Discover the latest trends in clothing, from timeless classics to avant-garde designs, curated to perfection for the discerning shopper seeking elegance and style.",
    "Sparkle and shine at the Gemstone Gallery Market, a treasure trove of exquisite jewelry. Explore a dazzling array of gemstones, from radiant diamonds to vibrant sapphires, each piece meticulously crafted to captivate hearts and turn heads.",
    "Unleash your creativity at Crafted Creations Bazaar, a haven for artisans and connoisseurs of unique craftsmanship. Browse through handcrafted jewelry, clothing, and leather goods, each item telling a story of skillful artistry and individuality.",
    "Elevate your wardrobe with the latest fashion trends at Fashionista Finds Fair. Indulge in a shopping experience like no other, where every garment is a statement piece waiting to be discovered, offering style, quality, and unparalleled flair.",
    "Immerse yourself in the world of luxury at Luxury Leather Lane, where fine craftsmanship meets timeless elegance. From sleek leather jackets to exquisite accessories, indulge in the finest leather goods that exude sophistication and refinement.",
    "Add a touch of glamour to your ensemble at Boutique Bling Bazaar, a dazzling showcase of statement jewelry and accessories. Explore a world of shimmering crystals, lustrous pearls, and eye-catching embellishments, guaranteed to make heads turn.",
    "Discover the artistry of fashion at Stylish Stitches Showcase, where every stitch tells a story of impeccable tailoring and attention to detail. Explore a curated collection of clothing that blends contemporary trends with timeless elegance, offering style and comfort in equal measure.",
    "Journey into a world of opulence at Jewel Junction Market, where luxury meets sophistication. Explore an exquisite selection of fine jewelry, meticulously crafted to perfection, featuring rare gemstones and precious metals that epitomize elegance and glamour.",
    "Experience the epitome of luxury at Leather Luxe Marketplace, a destination for discerning fashion enthusiasts. Discover a curated collection of premium leather goods, from sumptuous handbags to tailored jackets, each item exuding timeless style and unparalleled craftsmanship.",
    "Navigate the world of fashion with ease at Trendy Treasures Plaza, where the latest trends converge with timeless classics. Explore a diverse range of clothing and accessories that cater to every style preference, offering versatility, quality, and unbeatable value.",
    "Embark on a journey of glamour and sophistication at Glamour Grove Market, a haven for fashion-forward individuals. From chic apparel to statement accessories, immerse yourself in a world of style and elegance, where every item is designed to make a statement and leave a lasting impression.",
    "Explore the perfect fusion of edgy sophistication and feminine charm at Leather & Lace Boutique. Delve into a curated collection of leather goods and delicate lace pieces, each item crafted with precision and designed to accentuate your unique sense of style."
  ]

  LOCATIONS = [
    "140 Rue des Rosiers, 93400 Saint-Ouen, Paris, France",
    "Portobello Road, London W10 5TE, United Kingdom",
    "La Rambla, 91, 08001 Barcelona, Spain",
    "Büyükçarşı Cd., 34126 Fatih/İstanbul, Turkey",
    "Piazza del Mercato Centrale, 50123 Firenze FI, Italy",
    "Albert Cuypstraat, 1073 BD Amsterdam, Netherlands",
    "Havelská 763/29, 110 00 Staré Město, Czech Republic",
    "Bernauer Str. 63-64, 13355 Berlin, Germany",
    "Frederiksborggade 21, 1360 København, Denmark",
    "Campo de Santa Clara, 1100-472 Lisboa, Portugal",
    "Ifestou 45, Athina 105 55, Greece",
    "Kleparz, 31-042 Kraków, Poland"
  ]
end
