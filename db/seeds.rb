photo = Category.create(text: "写真")
art = Category.create(text: "アート")
move = Category.create(text: "映像")
food = Category.create(text: "フード & ドリンク")

photo_1 = photo.children.create(text: "ポートレート")
photo_2 = photo.children.create(text: "風景写真")
photo_3 = photo.children.create(text: "その他")

art_1 = art.children.create(text: "ペイント")
art_2 = art.children.create(text: "現代アート")
art_3 = art.children.create(text: "古典芸術")
art_4 = art.children.create(text: "その他")

move_1 = move.children.create(text: "実写映像")
move_2 = move.children.create(text: "アニメ")
move_3 = move.children.create(text: "その他")

food_1 = food.children.create(text: "食べ物")
food_2 = food.children.create(text: "ドリンク")
food_3 = food.children.create(text: "その他")