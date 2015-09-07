ColorTag.seed(:id, [
  { id: 1, name: "Neutral" },
  { id: 2, name: "Accents" },
  { id: 3, name: "Exuberant" }
])

StyleTag.seed(:id, [
  { id: 4, name: "Country" },
  { id: 5, name: "Urban" },
  { id: 6, name: "Traditional" },
  { id: 7, name: "Modern" }
])

images = Dir.glob(File.join(Rails.root, "db/fixtures/assets/images/quiz", "*.jpg"))

images.each_with_index do |item, index|
  question = Question.seed do |q|
    q.id = index + 1
    q.group_id = File.basename(item).split('_')[1]
    q.photo = File.open(item)
  end
  without_extension = File.basename(item).split('.')[0]
  group_index = without_extension.split('_')[1]
  photo_index = without_extension.split('_')[2]
  question_id = question.first.id
  case "#{group_index}_#{photo_index}"
    when "1_1"
      QuestionTag.seed(:id, id: 1, question_id: question_id, tag_id: Tag.find_by_name("Country").id)
    when "1_2"
      QuestionTag.seed(:id, id: 2, question_id: question_id, tag_id: Tag.find_by_name("Urban").id)
    when "2_1"
      QuestionTag.seed(:id, { id: 3, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 4, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "2_2"
      QuestionTag.seed(:id, { id: 5, question_id: question_id, tag_id: Tag.find_by_name("Urban").id},
                            { id: 6, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "3_1"
      QuestionTag.seed(:id, { id: 7, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 8, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "3_2"
      QuestionTag.seed(:id, { id: 9, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 10, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "4_1"
      QuestionTag.seed(:id, { id: 11, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 12, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "4_2"
      QuestionTag.seed(:id, { id: 13, question_id: question_id, tag_id: Tag.find_by_name("Urban").id}, 
                            { id: 14, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "5_1"
      QuestionTag.seed(:id, { id: 15, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 16, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "5_2"
      QuestionTag.seed(:id, { id: 17, question_id: question_id, tag_id: Tag.find_by_name("Urban").id}, 
                            { id: 18, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "6_1"
      QuestionTag.seed(:id, { id: 19, question_id: question_id, tag_id: Tag.find_by_name("Urban").id}, 
                            { id: 20, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "6_2"
      QuestionTag.seed(:id, { id: 21, question_id: question_id, tag_id: Tag.find_by_name("Urban").id}, 
                            { id: 22, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "7_1"
      QuestionTag.seed(:id, { id: 23, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "7_2"
      QuestionTag.seed(:id, { id: 24, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "8_1"
      QuestionTag.seed(:id, { id: 25, question_id: question_id, tag_id: Tag.find_by_name("Country").id}, 
                            { id: 26, question_id: question_id, tag_id: Tag.find_by_name("Modern").id})
    when "8_2"
      QuestionTag.seed(:id, { id: 27, question_id: question_id, tag_id: Tag.find_by_name("Urban").id}, 
                            { id: 28, question_id: question_id, tag_id: Tag.find_by_name("Traditional").id})
    when "9_1"
      QuestionTag.seed(:id, { id: 29, question_id: question_id, tag_id: Tag.find_by_name("Neutral").id})
    when "9_2"
      QuestionTag.seed(:id, { id: 30, question_id: question_id, tag_id: Tag.find_by_name("Accents").id})
    when "10_1"
      QuestionTag.seed(:id, { id: 31, question_id: question_id, tag_id: Tag.find_by_name("Exuberant").id})
    when "10_2"
      QuestionTag.seed(:id, { id: 32, question_id: question_id, tag_id: Tag.find_by_name("Neutral").id})
    when "11_1"
      QuestionTag.seed(:id, { id: 31, question_id: question_id, tag_id: Tag.find_by_name("Accents").id})
    when "11_2"
      QuestionTag.seed(:id, { id: 32, question_id: question_id, tag_id: Tag.find_by_name("Exuberant").id})
    end
end

StyleQuizResult.seed(:id,
  { id: 1, name: "Hand-Crafted Comfort", style_description: "You embrace spaces that are comfortable and inviting, often featuring hand-made items with textures that are not just appealing to the eye, but that feel good to the touch.\nWhen it comes to details, you look for ways that a room layout or piece of furniture will accommodate your personal habits. For example, a living room seating arrangement will need to provide a place for your coffee mug and magazines or it just won’t do.\nYour home should encourage friends to take a seat, relax and engage in deep conversation. Welcoming accessories, like fluffy pillows, knitted throws and fresh-picked flowers are essential." },
  { id: 2, name: "Everyday Natural", style_description: "Because you appreciate the small things in life, you find beauty in things you see and use everyday - from the trees growing outside the window to the coat-hooks hanging in the mud-room.\nYour admiration of nature's innate beauty inspires you to surround yourself with natural materials with little embellishment. Where others might see a rough-sawn plank of wood as unfinished, you see an artistic masterpiece in the intricacy of the wood grain, perfectly suitable for a table-top without any decorative paint or stylized form.\nDespite your no-fuss approach to design, your belief that good things can get better with time infuses your space with intense character, reflected in materials that are naturally weathered or broken-in after repeated use." },
  { id: 3, name: "Spirited Vogue", style_description: "You are energized by spaces that reflect an artist's balance of color, form and pattern. You see each room as a composition in which each surface finish, furniture piece and lighting element has a distinct and purposeful role to play. Careful not to over-embellish or over-accessorize, you avoid clutter and rely on clean graphic patterns to play the role of decorative ornament.\nBecause you have your pulse on the latest design trends, friends visiting your home quickly notice your impeccable sense of style. Look for ways to incorporate lasting design icons, like a Noguchi coffee table or an Eanes chair, into your space to help ensure that your room design stays relevant over time. Also be prepared change one aspect of your completed canvas on a regular basis, from accessories to an accent wall, as a way of evolving with design trends. While your home always looks finished to others, you know that an artist's work is never really complete!" },
  { id: 4, name: "Tailored Classic", style_description: "Whether you're shopping at Target or Ethan Allen, you look for furniture and home decor that reflects a timeless sense of style.\nBecause of their rich lines, proportions and detailing, you appreciate contemporary interpretations of classic design pieces - such as a Queen Anne wing chair, tufted chaise, or high-back settee. That said, you avoid overly ostentatious pieces as you believe true elegance and class is always understated.\nWith style that endures, proper maintenance is paramount. Anything that begins to look old, worn or dull must be replaced, refinished or polished. Your friends can testify that your home is well-kept.\nLook for small, simple details to enhance a space. For example, the proportions of a tall baseboard trim will make any room feel more stately and refined." }
)

ColorQuizResult.seed(:id,
  { id: 1, name: "Neutral", color_spectrum: File.open(File.join(Rails.root, 'db/fixtures/assets/images/color_result_neutral.png'), 'r'), color_description: "You have a preference for neutral color palettes, including beiges, creams, browns, black, gray and white. You find beauty in the many different hues that can be created from a single color simply by going from light to dark.\nIn addition to varying light and dark hues, look for a range of different textures of materials to add further richness to your space. Materials with a grain or weave are especially rich regardless of color. Other important textures include smooth (ceramic tile), rough (leather, burlap), matte, shiny and many more!" },
  { id: 2, name: "Accents", color_spectrum: File.open(File.join(Rails.root, 'db/fixtures/assets/images/color_result_accents.png'), 'r'), color_description: "You appreciate small bursts of color that bring vibrancy into your living space without overwhelming the senses.\nAccessories like pillows, flowers, vases, artwork, rugs, window treatments, blankets and towels are flexible way to incorporate color in a room while maintaining neutral finishes for more permanent surfaces like the floor or cabinetry.\nTo add some extra punch, highlight a single wall with a bold paint or wallpaper that coordinates with other color accents in your space." },
  { id: 3, name: "Exuberant", color_spectrum: File.open(File.join(Rails.root, 'db/fixtures/assets/images/color_result_exuberant.png'), 'r'), color_description: "You live for color, color, and more color! You are happiest in spaces that incorporate many different complementary colors and find neutral tones utterly boring.\nTo avoid a mixing and matching colors that just don't work well together, use a multi-colored pattern from a wall covering, rug, pillow or other fabric that you love as your color palette cheat sheet. It works every time!\nOne more secret: use contrasting white accents in trim and textiles to give an added pop to all the color in your home. You won't notice the white so much as the brilliant colors right next to it!" },
)