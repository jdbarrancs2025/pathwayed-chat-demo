/**
 * Reading question engine — a CURATED PASSAGE POOL (the reading analogue of
 * grammarTemplates.ts).
 *
 * Each entry is an ORIGINAL, hand-authored short passage in digital-SAT Reading &
 * Writing style, followed by one or more questions ABOUT that passage. One passage
 * can back several questions (the reading-set model), so the passage text is
 * stored once (public.passages) and every question points at it via passage_id —
 * no passage is repeated per stem. Every passage and question is written from
 * scratch to the public SAT format/skill spec: no real SAT or prep-company
 * passage or item is copied, reworded, or paraphrased.
 *
 * Each question carries: one correct option, three distractors each tagged with a
 * DISTINCT reading misconception token (with matching misconceptions.ts entries so
 * the Stage-4 explanations work exactly like math/grammar), and a difficulty. The
 * pool is served through the SAME generated_questions path (build-reading-seeds.ts
 * emits passages + questions), so reading skills appear in practice and score/
 * master identically — now with the passage rendered above the stem.
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface ReadingChoice {
  text: string
  is_correct: boolean
  misconception_token?: string // present on wrong choices; kebab-case, ^[a-z][a-z0-9-]*$
}

export interface ReadingItem {
  slot: number // stable id key within a skill (unique across the skill's passages)
  difficulty: Difficulty
  stem: string // the question asked about the passage
  choices: ReadingChoice[] // exactly one correct + 3 distinct-token distractors
  solution: string // brief explanation of the correct answer + why the others miss
}

export interface ReadingPassage {
  code: string // stable idempotency key, e.g. 'read-ebr-p01'
  skillSlug: string
  satAlignment: string
  gradeBand: string
  title?: string
  body: string // the original passage (a few sentences to a short paragraph)
  items: ReadingItem[] // one or more questions about THIS passage
}

// Allowed reading domain labels (from the taxonomy; asserted by the guard test).
export const READING_DOMAINS = ['information-and-ideas', 'craft-and-structure'] as const

// ============================================================================
// Evidence-Based Reading (9-12) — SAT "Information and Ideas": central ideas &
// details, command of textual evidence, and inference / most-logical-completion.
// 15 passages, 20 questions (five passages back two questions each), calibrated
// to 8 easy / 8 medium / 4 hard.
// ============================================================================

const EBR_PASSAGES: ReadingPassage[] = [
  {
    code: 'read-ebr-p01',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Honeybees communicate the location of food through a movement scientists call the waggle dance. The direction a bee moves during the dance points its hivemates toward the food, and the length of the dance signals how far away it is. In this way, a single scout can direct many bees to a flower patch it has found.',
    items: [
      {
        slot: 1,
        difficulty: 'easy',
        stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'The waggle dance lets one bee tell others where food is located.', is_correct: true },
          { text: 'Honeybees prefer flowers that grow close to the hive.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'The waggle dance is the only way bees can ever find food.', is_correct: false, misconception_token: 'too-broad' },
          { text: "A bee's dance shows other bees how much food a patch contains.", is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution:
          'The passage explains that the dance\'s direction and length tell other bees where the food is — that is its main point. It never says bees prefer nearby flowers, that the dance is the only method, or that it signals how much food there is.',
      },
    ],
  },
  {
    code: 'read-ebr-p02',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'When a city adds a protected bike lane to a busy street, the number of people who bike to work along that street usually rises within a year. Planners have found that many residents already own bicycles but avoid riding in traffic. A lane separated from cars removes the main reason they hesitate.',
    items: [
      {
        slot: 2,
        difficulty: 'easy',
        stem: 'Which choice best states the conclusion the planners reached?',
        choices: [
          { text: 'Safety concerns, more than a lack of bicycles, keep many residents from biking to work.', is_correct: true },
          { text: 'Most residents do not own bicycles.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Protected bike lanes reduce traffic congestion for cars.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Cities should replace all of their car lanes with bike lanes.', is_correct: false, misconception_token: 'too-broad' },
        ],
        solution:
          'The passage says residents already own bikes but avoid traffic, and a separated lane removes that reason — so safety, not a lack of bikes, is the barrier. It never claims most lack bikes, discusses car traffic, or calls for replacing all car lanes.',
      },
    ],
  },
  {
    code: 'read-ebr-p03',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'For decades, biologists assumed that the tuatara, a reptile found only in New Zealand, was a kind of lizard. Recent genetic studies, however, show that the tuatara belongs to a separate branch of reptiles whose other members died out long ago. The animal is therefore not a lizard but the last survivor of an ancient lineage.',
    items: [
      {
        slot: 3,
        difficulty: 'easy',
        stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'New genetic evidence shows the tuatara is not a lizard but the sole survivor of an ancient reptile group.', is_correct: true },
          { text: 'The tuatara is the most common reptile in New Zealand.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Biologists have always known that the tuatara was not a lizard.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Genetic studies are the only valid way to classify any reptile.', is_correct: false, misconception_token: 'too-broad' },
        ],
        solution:
          "The passage's point is that genetic evidence reclassifies the tuatara as the last of an ancient line, not a lizard. It doesn't say the tuatara is the most common reptile, that biologists always knew this (they assumed the opposite), or that genetics is the only classification method.",
      },
      {
        slot: 4,
        difficulty: 'medium',
        stem: 'Which statement, if true, would most strengthen the conclusion that the tuatara is not a lizard?',
        choices: [
          { text: "The tuatara's genes differ from those of all living lizards as much as lizards' genes differ from snakes'.", is_correct: true },
          { text: 'The tuatara lives only in New Zealand and nowhere else on Earth.', is_correct: false, misconception_token: 'wrong-evidence' },
          { text: 'The tuatara can live for more than a century.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'The tuatara closely resembles some lizards in its overall body shape.', is_correct: false, misconception_token: 'reverses-relationship' },
        ],
        solution:
          'A genetic gap as large as the one between different reptile groups directly supports the claim that the tuatara is not a lizard. Its location and lifespan are irrelevant to classification, and resembling lizards in body shape would point the other way.',
      },
    ],
  },
  {
    code: 'read-ebr-p04',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Mara had rehearsed her lines for weeks, but as she stepped onto the stage the bright lights erased every word from her mind. For a moment she stood frozen. Then she looked out, found her younger brother grinning in the front row, and the opening line came back to her as easily as breathing.',
    items: [
      {
        slot: 5,
        difficulty: 'easy',
        stem: 'Which choice best describes what helps Mara recover?',
        choices: [
          { text: 'Seeing a familiar, encouraging face calms her enough to remember her line.', is_correct: true },
          { text: 'She decides to make up new lines instead of the ones she rehearsed.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'The stage lights dim so that she can finally see the audience.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Her brother calls out the opening line to remind her of it.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          "The rehearsed line returns the moment she sees her brother's encouraging grin, so a familiar face steadies her. She doesn't invent new lines, the lights don't change, and her brother only grins — he doesn't feed her the line.",
      },
    ],
  },
  {
    code: 'read-ebr-p05',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Sea otters eat large numbers of sea urchins. Where otters are plentiful, urchin populations stay low, and the kelp forests that urchins feed on grow thick and tall. Where otters have disappeared, urchins multiply and strip the kelp bare, leaving barren stretches of seafloor.',
    items: [
      {
        slot: 6,
        difficulty: 'easy',
        stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'By keeping urchins in check, sea otters help kelp forests thrive.', is_correct: true },
          { text: 'Kelp forests grow best in places where sea otters have disappeared.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Kelp forests survive by feeding on the local sea urchins.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Sea otters prefer kelp forests to every other habitat.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          'The passage shows that otters eating urchins keeps urchin numbers down so kelp can thrive — otters protect the kelp indirectly. Kelp does worse without otters, urchins eat kelp (not the reverse), and the passage never says otters prefer kelp habitats.',
      },
    ],
  },
  {
    code: 'read-ebr-p06',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'In the 1850s, many American towns had no public libraries; books were expensive and mostly owned by the wealthy. Reformers argued that a democracy depended on an informed public, and that ordinary citizens could not govern wisely without access to books. Free town libraries, they insisted, were not a luxury but a civic necessity.',
    items: [
      {
        slot: 7,
        difficulty: 'easy',
        stem: "Which choice best states the reformers' main argument?",
        choices: [
          { text: 'Free public libraries are essential to a functioning democracy, not a mere luxury.', is_correct: true },
          { text: 'Books in the 1850s were cheap and already widely owned.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'The reformers cared more about helping the wealthy than ordinary citizens.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Public libraries mainly helped towns attract new businesses.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution:
          'The reformers held that libraries were a civic necessity for democracy. The passage says books were expensive (not cheap), that reformers championed ordinary citizens (not the wealthy), and never mentions attracting businesses.',
      },
      {
        slot: 8,
        difficulty: 'easy',
        stem: 'According to the text, why did few ordinary citizens own books in the 1850s?',
        choices: [
          { text: 'Books were expensive and were held mostly by wealthy people.', is_correct: true },
          { text: 'Most towns had banned the sale of books.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Reformers actively discouraged citizens from reading.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Books were treated as a civic necessity.', is_correct: false, misconception_token: 'partly-right' },
        ],
        solution:
          "The text states books were expensive and owned mainly by the wealthy. No ban is mentioned, reformers encouraged reading, and 'civic necessity' describes the reformers' view of libraries — not the reason books were scarce.",
      },
    ],
  },
  {
    code: 'read-ebr-p07',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Some desert plants open the tiny pores in their leaves only at night. During the cool darkness, they take in the carbon dioxide they need and store it until morning. By keeping their pores closed through the hot day, these plants lose far less water than plants that open their pores in sunlight.',
    items: [
      {
        slot: 9,
        difficulty: 'easy',
        stem: 'Which choice best explains why opening pores at night helps these desert plants?',
        choices: [
          { text: 'Cooler nighttime air means the plants lose less water while taking in carbon dioxide.', is_correct: true },
          { text: 'Plants can absorb carbon dioxide only in complete darkness.', is_correct: false, misconception_token: 'too-broad' },
          { text: "The night air holds richer carbon dioxide than the day's air does.", is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Keeping the pores closed lets the plants take in more sunlight.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution:
          "The passage links night pores to losing 'far less water' in the cool dark. It doesn't claim CO2 can be absorbed only at night (other plants use daylight), that night air is richer in CO2, or that closed pores gather sunlight.",
      },
    ],
  },
  {
    code: 'read-ebr-p08',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Economists once assumed that people always make choices that maximize their own benefit. Later experiments told a more complicated story: participants often rejected unfair offers even when doing so cost them money, apparently valuing fairness over pure gain. These results suggested that human decisions are shaped by more than self-interest alone.',
    items: [
      {
        slot: 10,
        difficulty: 'medium',
        stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'Experiments revealed that people weigh fairness, not just personal gain, when making decisions.', is_correct: true },
          { text: 'People always act to maximize their own benefit.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Economists no longer study human decision-making at all.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Participants in the experiments earned more money than they had expected.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          'The passage\'s point is that fairness, not just self-interest, shapes decisions. The first wrong choice restates the assumption the experiments overturned; the others are never stated.',
      },
    ],
  },
  {
    code: 'read-ebr-p09',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'A team studying a remote lake found that its water had grown clearer over ten years. At first they credited stricter pollution limits. But they also noticed the arrival of an invasive mussel that filters algae from the water as it feeds. The researchers concluded that the mussels, not the new regulations, were the main cause of the change.',
    items: [
      {
        slot: 11,
        difficulty: 'medium',
        stem: "Which choice best states the researchers' conclusion?",
        choices: [
          { text: 'An invasive mussel, rather than pollution limits, was chiefly responsible for the clearer water.', is_correct: true },
          { text: 'Stricter pollution limits were the main reason the lake grew clearer.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: "The invasive mussel made the lake's water more polluted.", is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Invasive species are always harmful to the lakes they enter.', is_correct: false, misconception_token: 'too-broad' },
        ],
        solution:
          'The researchers concluded the mussel, not regulation, mainly caused the clearing. The passage rules out regulation as the main cause, says the mussel filtered (cleared) algae rather than polluting, and never claims all invasive species are harmful.',
      },
      {
        slot: 12,
        difficulty: 'medium',
        stem: "Which finding, if true, would most support the researchers' conclusion?",
        choices: [
          { text: 'In a nearby lake with the same pollution limits but no mussels, the water stayed cloudy.', is_correct: true },
          { text: "The lake's water became a little clearer in each of the ten years.", is_correct: false, misconception_token: 'wrong-evidence' },
          { text: 'The invasive mussel is originally native to another continent.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Most people had expected the pollution limits to work.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          'A comparison lake with the same limits but no mussels staying cloudy isolates the mussel as the cause — strong support. That the water cleared each year shows the effect but not its cause; the mussel\'s origin and people\'s expectations are irrelevant.',
      },
    ],
  },
  {
    code: 'read-ebr-p10',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Grandfather rarely spoke about the years he spent at sea. But every so often, setting down his tea, he would describe a particular harbor at dusk — the smell of salt, the creak of the ropes — with such precision that the kitchen seemed to fall away. Then he would fall silent again, as if he had said too much.',
    items: [
      {
        slot: 13,
        difficulty: 'medium',
        stem: 'Which choice best describes what the passage suggests about the grandfather?',
        choices: [
          { text: 'His memories of the sea remain vivid and moving, even though he seldom shares them.', is_correct: true },
          { text: 'He has forgotten most of the years he spent at sea.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'He avoids talking about the sea because the memories bore him.', is_correct: false, misconception_token: 'misreads-tone' },
          { text: 'He wishes he had never gone to sea in the first place.', is_correct: false, misconception_token: 'unsupported-inference' },
        ],
        solution:
          "The vivid, precise memory and his sudden silence 'as if he had said too much' suggest the memories still move him deeply. He hasn't forgotten them, he isn't bored, and the passage never says he regrets going.",
      },
    ],
  },
  {
    code: 'read-ebr-p11',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Engineers designing quieter aircraft have borrowed an idea from owls, whose feathers have a soft, frayed edge that breaks up the rushing air and muffles sound. By adding a similar jagged trailing edge to airplane wings and wind-turbine blades, designers have measurably reduced the noise these machines make.',
    items: [
      {
        slot: 14,
        difficulty: 'medium',
        stem: "Which choice most logically completes the text's explanation of the design?",
        choices: [
          { text: 'the jagged edge quiets the machines by disrupting the airflow that would otherwise create noise.', is_correct: true },
          { text: 'the new design makes the machines fly noticeably faster than before.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'owls are the quietest of all flying animals.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'smooth wing edges reduce noise better than frayed ones do.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution:
          "The passage says owl feathers' frayed edges 'break up the rushing air' to muffle sound, and the wing copies that — so the jagged edge quiets noise by disrupting airflow. Speed isn't mentioned, owls aren't ranked against other animals, and frayed (not smooth) edges reduce the noise.",
      },
    ],
  },
  {
    code: 'read-ebr-p12',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: "The mayor's plan to close the old riverside factory district and build a park has been called a gift to the city. Yet the plan sets aside no money to retrain the four hundred workers the factories employ. A park that residents cannot afford to enjoy, because they have lost their jobs, is a hollow kind of gift.",
    items: [
      {
        slot: 15,
        difficulty: 'medium',
        stem: "Which choice best states the author's main point?",
        choices: [
          { text: 'The park plan is flawed because it ignores the workers who would lose their jobs.', is_correct: true },
          { text: 'The city does not need any new parks at all.', is_correct: false, misconception_token: 'too-broad' },
          { text: "The mayor's plan will clearly succeed in helping the city's workers.", is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Riverside parks are more valuable than factories.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution:
          "The author calls the park a 'hollow gift' precisely because it ignores the four hundred workers — that is the main point. The author doesn't reject parks in general, doesn't say the plan helps workers (the opposite), and doesn't compare the value of parks and factories.",
      },
      {
        slot: 16,
        difficulty: 'hard',
        stem: "As it is used in the text, the phrase 'a hollow kind of gift' primarily serves to",
        choices: [
          { text: "underscore that the plan's benefits are undercut by what it overlooks.", is_correct: true },
          { text: 'praise the mayor for a generous and well-designed plan.', is_correct: false, misconception_token: 'misreads-tone' },
          { text: 'suggest that the finished park will be physically empty and unused.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'propose a specific alternative to building the park.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution:
          "'Hollow gift' turns the praise ('a gift') against itself, stressing that ignoring the workers empties the plan of real value. It isn't praise, doesn't mean the park is literally empty, and offers no alternative.",
      },
    ],
  },
  {
    code: 'read-ebr-p13',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Certain cave-dwelling fish have, over many generations, lost their eyes entirely. Biologists once viewed this simply as decay from disuse. A newer view holds that building and maintaining eyes costs energy, and in a lightless cave where eyes are useless, fish that spent less energy on them may have survived and reproduced more successfully. Eyelessness, in this view, was not merely lost but favored.',
    items: [
      {
        slot: 17,
        difficulty: 'hard',
        stem: 'Which choice best captures the distinction the passage draws between the two views?',
        choices: [
          { text: 'The older view saw eye loss as passive decay; the newer view sees it as an advantage that was actively favored.', is_correct: true },
          { text: 'Both views agree that losing their eyes harmed the cave fish.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'The newer view holds that the fish will eventually regrow their eyes.', is_correct: false, misconception_token: 'unsupported-inference' },
          { text: 'The older view claimed that eyes cost too much energy to maintain.', is_correct: false, misconception_token: 'partly-right' },
        ],
        solution:
          'The contrast is between eye loss as passive decay (older) and as an energy-saving advantage that was favored (newer). The newer view says the loss helped (not harmed), says nothing about regrowing eyes, and it is the newer view — not the older — that stresses energy cost.',
      },
    ],
  },
  {
    code: 'read-ebr-p14',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'A study tracked whether posting calorie counts on menus changed what diners ordered. On average, the labels made little difference to the meals people chose. But the researchers cautioned against dismissing labels entirely: among diners who said they were actively trying to eat healthily, the counts did shift orders toward lower-calorie dishes. The effect, they argued, depended on the diner.',
    items: [
      {
        slot: 18,
        difficulty: 'hard',
        stem: "Which finding, if true, would most support the researchers' caution against dismissing menu labels?",
        choices: [
          { text: 'Diners who were already motivated to eat healthily ordered fewer calories when counts were shown.', is_correct: true },
          { text: 'On average, diners ignored the calorie counts entirely.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Most of the restaurants in the study already posted calorie counts.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'The calorie counts were printed in large, easy-to-read type.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          "The researchers' caution rests on the labels working for motivated diners, so evidence of that effect supports them. The average non-effect supports the opposite view, and the number of restaurants or the type size is irrelevant.",
      },
      {
        slot: 19,
        difficulty: 'hard',
        stem: "Which choice most logically follows from the study's findings?",
        choices: [
          { text: "Whether menu labels change behavior depends largely on a diner's existing goals.", is_correct: true },
          { text: 'Menu labels change the behavior of nearly all diners.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Removing calorie counts would help people eat more healthily.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Calorie labels are the single most effective public-health tool available.', is_correct: false, misconception_token: 'too-broad' },
        ],
        solution:
          "The split result — little average effect but a real effect for motivated diners — points to behavior depending on the diner's goals. Labels don't move nearly all diners, removing them wouldn't help health, and the passage never ranks labels against other tools.",
      },
    ],
  },
  {
    code: 'read-ebr-p15',
    skillSlug: 'evidence-based-reading',
    satAlignment: 'information-and-ideas',
    gradeBand: '9-12',
    body: 'Writing in 1791, a pamphleteer urged the new republic to fund public schools. An educated citizenry, she argued, was the surest defense against tyranny: rulers found it far harder to deceive people who could read the laws and the history of their own country. To leave the poor unschooled, she warned, was to leave the whole nation vulnerable.',
    items: [
      {
        slot: 20,
        difficulty: 'medium',
        stem: "Which choice best states the pamphleteer's central claim?",
        choices: [
          { text: 'Public education protects a republic by making its citizens harder to deceive.', is_correct: true },
          { text: 'Only wealthy citizens can be trusted to govern a republic.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'Reading history matters more than reading the law.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Tyranny is impossible in any republic that has a constitution.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution:
          'Her claim is that an educated public guards against tyranny because informed citizens are harder to deceive. She champions schooling the poor (not distrusting them), ranks neither kind of reading over the other, and never says a constitution makes tyranny impossible.',
      },
    ],
  },
]

// ============================================================================
// Main Idea (3-5) — SAT "Information and Ideas", grade-appropriate: short, simple
// passages; questions about the central idea, best title, and the detail that
// supports it. 16 passages, 20 questions (four back two each), 8 easy / 8 medium
// / 4 hard.
// ============================================================================

const MAIN_IDEA_PASSAGES: ReadingPassage[] = [
  {
    code: 'read-mi-p01', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Ants are small, but they are very strong. A single ant can lift a crumb many times heavier than its own body. Working together, a group of ants can carry food much bigger than any one of them.',
    items: [{
      slot: 1, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Ants are strong for their size and can carry heavy things, especially together.', is_correct: true },
        { text: 'Ants are the smallest insects in the whole world.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'One ant once found a very large crumb.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        { text: 'Ants cannot move food that is bigger than they are.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: 'The passage is mostly about how strong ants are for their size and how they carry heavy food together. The other choices are not stated, focus on a small detail, or say the opposite of the passage.',
    }],
  },
  {
    code: 'read-mi-p02', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Maria wanted to grow tomatoes. She planted seeds in a sunny spot and watered them every day. She pulled out the weeds so they would not crowd her plants. After many weeks, red tomatoes finally appeared.',
    items: [{
      slot: 2, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Maria took care of her plants over time, and they grew tomatoes.', is_correct: true },
        { text: 'Weeds are the biggest problem for every garden.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'Maria watered her seeds only one time.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Tomatoes turn red when they are ready.', is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: "The passage tells how Maria cared for her plants until they grew tomatoes. It doesn't say weeds are every garden's biggest problem, she watered daily (not once), and the color of ripe tomatoes is just a small detail.",
    }],
  },
  {
    code: 'read-mi-p03', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Bats are not birds, even though they can fly. Bats have fur, not feathers, and they feed milk to their babies, just like other mammals. They are the only mammals that can truly fly.',
    items: [
      {
        slot: 3, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'Bats are flying mammals, not birds.', is_correct: true },
          { text: 'Bats are a kind of bird that happens to have fur.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'All mammals are able to fly.', is_correct: false, misconception_token: 'too-broad' },
          { text: 'Bat babies drink milk.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        ],
        solution: 'The main point is that bats are mammals that fly, not birds. The passage says they are not birds, that only bats among mammals fly (not all mammals), and the milk detail supports the point but is not the main idea.',
      },
      {
        slot: 4, difficulty: 'medium', stem: 'Which detail from the passage best shows that bats are mammals?',
        choices: [
          { text: 'Bats have fur and feed milk to their babies.', is_correct: true },
          { text: 'Bats can fly through the air.', is_correct: false, misconception_token: 'wrong-evidence' },
          { text: 'Bats are not birds.', is_correct: false, misconception_token: 'partly-right' },
          { text: 'Bats come out at night.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "Having fur and feeding milk are mammal traits, so that detail supports the point. Flying doesn't prove it (birds fly too), 'not birds' is the claim rather than the evidence for it, and coming out at night isn't in the passage.",
      },
    ],
  },
  {
    code: 'read-mi-p04', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The school held a book fair to raise money for the library. Students brought coins and bought used books for a dollar each. By the end of the week, the fair had earned enough to buy ten new books for the library.',
    items: [{
      slot: 5, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'A school book fair raised money to buy new library books.', is_correct: true },
        { text: 'Used books always cost exactly one dollar.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'The library had only ten books in all.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Students enjoy collecting coins.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "The passage is about the book fair raising money for new library books. A dollar was the fair's price (not always), ten was how many new books were bought, and 'students enjoy coins' isn't in the passage.",
    }],
  },
  {
    code: 'read-mi-p05', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Penguins live where it is very cold. To stay warm, they huddle close together in large groups. The penguins on the outside slowly move to the middle, and the ones in the middle move out, so everyone gets a turn in the warm center.',
    items: [{
      slot: 6, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Penguins huddle together and take turns in the middle to stay warm.', is_correct: true },
        { text: 'Penguins are the only animals that live in cold places.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'Penguins never move once they start to huddle.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'The center of the huddle is the warmest spot.', is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: 'The passage explains how penguins share warmth by huddling and taking turns. They are not the only cold-weather animals, they do move (taking turns), and the warm center is a detail that supports the main idea.',
    }],
  },
  {
    code: 'read-mi-p06', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Long ago, people told time by looking at the sun. When the sun was high in the sky, they knew it was the middle of the day. But on cloudy days, and at night, the sun could not help them. That is one reason people invented clocks.',
    items: [
      {
        slot: 7, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'People invented clocks partly because the sun could not always tell them the time.', is_correct: true },
          { text: 'The sun is always the best way to tell time.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'People long ago did not care about time at all.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Clocks were invented at night.', is_correct: false, misconception_token: 'partly-right' },
        ],
        solution: "The passage explains that because the sun failed on cloudy days and at night, people made clocks. The sun isn't always best, people did track time, and 'at night' names a problem with the sun, not when clocks were invented.",
      },
      {
        slot: 8, difficulty: 'easy', stem: 'According to the passage, when could the sun NOT help people tell time?',
        choices: [
          { text: 'On cloudy days and at night.', is_correct: true },
          { text: 'When the sun was high in the sky.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Only during the winter.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'When they were already using a clock.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution: 'The passage says the sun could not help on cloudy days and at night. A high sun was when it DID help, winter is never mentioned, and clocks are not given as a reason the sun failed.',
      },
    ],
  },
  {
    code: 'read-mi-p07', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Honey never goes bad. Jars of honey found in very old tombs were still good to eat after thousands of years. Bees make honey in a special way that keeps tiny germs from growing in it.',
    items: [{
      slot: 9, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Honey can last a very long time without spoiling.', is_correct: true },
        { text: 'All foods last forever if you keep them in a tomb.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'Honey was once found in a single old tomb.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        { text: 'Bees like to eat honey when it is old.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'The passage is about how honey lasts without spoiling. Not all foods last forever, the tomb example is a supporting detail, and bees eating old honey is never mentioned.',
    }],
  },
  {
    code: 'read-mi-p08', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Deon was nervous about the swim race. His hands shook as he stood on the block. But when the whistle blew, he dove in and swam as hard as he could. He did not win, but he beat his own best time, and that made him proud.',
    items: [{
      slot: 10, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Deon was nervous but tried his best and was proud of improving.', is_correct: true },
        { text: 'Deon won first place in the swim race.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Winning is the only reason anyone should feel proud.', is_correct: false, misconception_token: 'too-broad' },
        { text: "Deon's hands shook before the race.", is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: 'The passage is about Deon facing his nerves, doing his best, and feeling proud of beating his own time. He did not win, the passage does not say winning is the only source of pride, and his shaking hands are a small detail.',
    }],
  },
  {
    code: 'read-mi-p09', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Sea turtles lay their eggs on sandy beaches. When the baby turtles hatch, they crawl toward the brightest light, which is usually the moon shining on the ocean. This helps them find their way to the water. But bright lights from buildings can confuse them and send them the wrong way.',
    items: [
      {
        slot: 11, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'Baby sea turtles use light to find the ocean, but city lights can lead them the wrong way.', is_correct: true },
          { text: 'Sea turtles cannot see any light at all.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'The moon is brighter than the ocean is deep.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Baby turtles hatch out of eggs.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        ],
        solution: 'The passage explains that hatchlings follow the brightest light to the sea and that building lights can misdirect them. They do use light, the moon and ocean are not compared, and hatching from eggs is a supporting detail.',
      },
      {
        slot: 12, difficulty: 'medium', stem: 'Based on the passage, why might turning off beach lights at night help baby turtles?',
        choices: [
          { text: 'Without bright building lights, the turtles are more likely to head toward the moonlit ocean.', is_correct: true },
          { text: 'The turtles would then lay many more eggs.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Darkness would make the turtles grow faster.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'The turtles would crawl away from the water.', is_correct: false, misconception_token: 'reverses-relationship' },
        ],
        solution: 'If building lights are off, the brightest light is again the moon on the ocean, guiding turtles the right way. Egg-laying and growth are not discussed, and turning off lights would lead them toward the water, not away.',
      },
    ],
  },
  {
    code: 'read-mi-p10', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Recycling helps our planet. When we recycle paper, cans, and bottles, they can be made into new things instead of being thrown away. This saves materials and keeps trash out of the ground.',
    items: [{
      slot: 13, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Recycling turns used items into new ones and helps the planet.', is_correct: true },
        { text: 'Paper is the only thing that can ever be recycled.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Everyone in the world recycles every single day.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Trash can end up in the ground.', is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: 'The passage is about how recycling reuses materials and helps the planet. Cans and bottles are recycled too, no one is said to recycle daily, and trash in the ground is a detail rather than the main point.',
    }],
  },
  {
    code: 'read-mi-p11', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'A chameleon can change the color of its skin. Sometimes it changes color to match a leaf or branch so that it is hard to see. Other times it changes color to show how it feels or to warm up in the sun.',
    items: [{
      slot: 14, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Chameleons change color for more than one reason.', is_correct: true },
        { text: 'Chameleons change color only to hide from danger.', is_correct: false, misconception_token: 'too-narrow' },
        { text: 'Chameleons are always the color green.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'A chameleon once sat on a branch.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'The passage lists several reasons chameleons change color, so the main idea is that they do it for more than one reason. Hiding is only one reason, they are not always green, and no chameleon sitting on a branch is described.',
    }],
  },
  {
    code: 'read-mi-p12', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Volcanoes can be dangerous, but they also help the land. When a volcano erupts, it spreads ash over the ground. Over time, this ash breaks down and makes the soil rich, so plants grow well near volcanoes.',
    items: [
      {
        slot: 15, difficulty: 'medium', stem: 'Which choice best states the main idea of the text?',
        choices: [
          { text: 'Even though volcanoes are dangerous, their ash can make soil good for plants.', is_correct: true },
          { text: 'Volcanoes are only dangerous and are never helpful.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Plants cannot grow anywhere except right next to volcanoes.', is_correct: false, misconception_token: 'too-broad' },
          { text: 'Ash spreads over the ground after an eruption.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        ],
        solution: 'The passage balances the danger of volcanoes with how their ash enriches soil. It does not say volcanoes are only dangerous or that plants grow only near volcanoes, and "ash spreads" is a detail that leads to the main idea.',
      },
      {
        slot: 16, difficulty: 'hard', stem: 'Which of these would be the best title for the passage?',
        choices: [
          { text: 'How Volcanoes Can Help Plants Grow', is_correct: true },
          { text: 'All About How Dangerous Volcanoes Are', is_correct: false, misconception_token: 'too-narrow' },
          { text: 'Everything About Rocks and Mountains', is_correct: false, misconception_token: 'too-broad' },
          { text: 'Why Volcanic Ash Is Gray', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "The passage is about volcanoes helping plants through their ash, so that title fits best. A title only about danger leaves out the helpful main point (too narrow), 'rocks and mountains' is far too general, and ash's color is never discussed.",
      },
    ],
  },
  {
    code: 'read-mi-p13', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Owls are good night hunters. Their large eyes help them see in very little light. Their soft feathers let them fly almost silently, so mice and other small animals do not hear them coming.',
    items: [{
      slot: 17, difficulty: 'hard', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Owls have special features that make them skilled hunters at night.', is_correct: true },
        { text: 'Owls have very large eyes.', is_correct: false, misconception_token: 'detail-not-main-idea' },
        { text: 'Owls do their hunting during the day.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Mice are the smartest of all animals.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "The passage explains how owls' eyes and feathers make them good night hunters — that's the main idea. Large eyes are one detail, owls hunt at night (not day), and nothing is said about mice being smart.",
    }],
  },
  {
    code: 'read-mi-p14', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Long ago, sailors used the stars to find their way across the ocean. They learned which stars stayed in the same place in the sky. By following those stars at night, they could sail toward the right land even when they could not see it.',
    items: [{
      slot: 18, difficulty: 'hard', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Sailors long ago used the stars to guide their ships across the ocean.', is_correct: true },
        { text: 'Sailors were only able to sail during the daytime.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'The ocean is very large and very deep.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'Some stars stay in the same place in the sky.', is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: 'The passage is about sailors using steady stars to navigate at night. They sailed at night (not only day), the size of the ocean is not the point, and "some stars stay put" is a detail that supports the main idea.',
    }],
  },
  {
    code: 'read-mi-p15', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'A rainbow appears when the sun shines through rain. The tiny drops of water bend the sunlight and split it into many colors. That is why we often see rainbows right after it stops raining, while the sun is still out.',
    items: [{
      slot: 19, difficulty: 'easy', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Rainbows form when sunlight shines through raindrops and splits into colors.', is_correct: true },
        { text: 'Rainbows only ever appear in the middle of the night.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Rain itself is naturally made of many colors.', is_correct: false, misconception_token: 'reverses-relationship' },
        { text: 'The sun is extremely hot.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'The passage explains that rainbows form when sunlight passes through raindrops. Rainbows need sunlight (not night), it is the light that splits into colors (not the rain that is colored), and the sun\'s heat is not discussed.',
    }],
  },
  {
    code: 'read-mi-p16', skillSlug: 'main-idea', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Some people think all spiders are insects, but they are not. Insects have six legs and three body parts. Spiders have eight legs and only two body parts. Spiders belong to a different animal group called arachnids.',
    items: [{
      slot: 20, difficulty: 'hard', stem: 'Which choice best states the main idea of the text?',
      choices: [
        { text: 'Spiders are not insects; they belong to a different group and have eight legs.', is_correct: true },
        { text: 'Spiders and insects are exactly the same kind of animal.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Spiders are the scariest animals of all.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'Spiders have two body parts.', is_correct: false, misconception_token: 'detail-not-main-idea' },
      ],
      solution: 'The main idea is that spiders are arachnids, not insects, with eight legs and two body parts. Spiders and insects are not the same, "scariest" is not in the passage, and "two body parts" is a detail that supports the main idea.',
    }],
  },
]

// ============================================================================
// Reading Comprehension (3-5) — SAT "Information and Ideas": literal
// understanding and simple inference over short, grade-appropriate passages.
// 16 passages, 20 questions (four back two each), 8 easy / 8 medium / 4 hard.
// ============================================================================

const READING_COMP_PASSAGES: ReadingPassage[] = [
  {
    code: 'read-rc-p01', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: "Sam's dog, Biscuit, loves to play fetch. Every afternoon, Sam throws a ball across the yard, and Biscuit races after it. Biscuit brings the ball back and drops it at Sam's feet, waiting for another throw.",
    items: [{
      slot: 1, difficulty: 'easy', stem: 'What does Biscuit do after chasing the ball?',
      choices: [
        { text: "He brings it back and drops it at Sam's feet.", is_correct: true },
        { text: 'He hides the ball somewhere in the yard.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'He chews the ball into little pieces.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'He waits for Sam to go find the ball.', is_correct: false, misconception_token: 'reverses-relationship' },
      ],
      solution: "The passage says Biscuit brings the ball back and drops it at Sam's feet. He doesn't hide or chew it, and Sam doesn't have to find it — Biscuit returns it.",
    }],
  },
  {
    code: 'read-rc-p02', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The library is open every day except Sunday. On weekdays it opens at nine in the morning. On Saturday it opens later, at noon, and closes early so the workers can rest.',
    items: [{
      slot: 2, difficulty: 'easy', stem: 'On which day is the library closed?',
      choices: [
        { text: 'Sunday.', is_correct: true },
        { text: 'Saturday.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Every weekday morning.', is_correct: false, misconception_token: 'reverses-relationship' },
        { text: 'The library is open on all seven days.', is_correct: false, misconception_token: 'too-broad' },
      ],
      solution: "The passage says the library is open every day except Sunday. It's open Saturdays (at noon) and on weekday mornings, and it is not open all seven days.",
    }],
  },
  {
    code: 'read-rc-p03', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Ana planted a small apple tree in her backyard. For the first two years, it grew taller but had no fruit. Ana was patient and kept watering it. In the third year, the tree finally grew its first apples, and Ana shared them with her neighbors.',
    items: [
      {
        slot: 3, difficulty: 'easy', stem: 'How many years passed before the tree grew apples?',
        choices: [
          { text: 'Three years.', is_correct: true },
          { text: 'One year.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Two years.', is_correct: false, misconception_token: 'partly-right' },
          { text: 'Ten years.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution: 'The tree grew its first apples in the third year. After one and two years it still had none, and ten years is never mentioned.',
      },
      {
        slot: 4, difficulty: 'medium', stem: "What do Ana's actions show about her?",
        choices: [
          { text: 'She is patient and willing to wait for good results.', is_correct: true },
          { text: 'She gives up easily when things are slow.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'She thinks the tree will never grow any fruit.', is_correct: false, misconception_token: 'unsupported-inference' },
          { text: 'She cares only about apples and nothing else.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "Ana waited three years and kept watering, then shared the apples — that shows patience. She didn't give up, she kept caring for the tree (so she didn't think it hopeless), and 'cares only about apples' isn't supported.",
      },
    ],
  },
  {
    code: 'read-rc-p04', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'When it gets cold in the fall, many birds fly south to warmer places. This long trip is called migration. The birds return north in the spring, when the weather warms up and there is more food to find.',
    items: [{
      slot: 5, difficulty: 'easy', stem: 'Why do the birds fly south in the fall?',
      choices: [
        { text: 'To reach warmer places when it gets cold.', is_correct: true },
        { text: 'Because they get lost on the way.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'To stay in the coldest weather they can find.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Because there is more food up north in the fall.', is_correct: false, misconception_token: 'reverses-relationship' },
      ],
      solution: 'The birds fly south to reach warmer places when it turns cold. They are not lost, they leave the cold (not seek it), and more food up north is a reason they return in spring.',
    }],
  },
  {
    code: 'read-rc-p05', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Jena forgot her lunch at home. At noon, she felt worried and hungry. Then her friend Ravi noticed and offered to share his sandwich and apple. Jena smiled and thanked him.',
    items: [{
      slot: 6, difficulty: 'easy', stem: 'How does Ravi help Jena?',
      choices: [
        { text: 'He shares his own food with her.', is_correct: true },
        { text: 'He buys her a brand-new lunch.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'He drives her home to get her lunch.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'He eats her lunch for her.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: 'Ravi shares his sandwich and apple with Jena. He does not buy lunch, take her home, or eat her lunch — she forgot hers.',
    }],
  },
  {
    code: 'read-rc-p06', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'A spider builds its web out of silk that comes from inside its body. The web is sticky, so insects that fly into it get stuck. When an insect is caught, the spider feels the web shake and hurries over to catch its meal.',
    items: [
      {
        slot: 7, difficulty: 'medium', stem: 'How does a spider know an insect has landed in its web?',
        choices: [
          { text: 'It feels the web shake.', is_correct: true },
          { text: 'It hears the insect buzzing loudly.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'The web changes color when an insect lands.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'The insect flies over to the spider.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: 'The passage says the spider feels the web shake. It does not say the spider hears buzzing or that the web changes color, and the insect is stuck, so it cannot fly to the spider.',
      },
      {
        slot: 8, difficulty: 'easy', stem: "What is the spider's web made of?",
        choices: [
          { text: "Silk that comes from inside the spider's body.", is_correct: true },
          { text: 'Sticky leaves from a tree.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Thin pieces of wood.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Drops of water.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: "The web is made of silk from inside the spider's body. It is not made of leaves, wood, or water.",
      },
    ],
  },
  {
    code: 'read-rc-p07', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Marcus built a fort out of couch cushions in the living room. He stacked them into walls and left a small gap for a door. He crawled inside and read his favorite comic book by flashlight.',
    items: [{
      slot: 9, difficulty: 'easy', stem: 'Where did Marcus build his fort?',
      choices: [
        { text: 'In the living room.', is_correct: true },
        { text: 'In his bedroom.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Outside in the yard.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'At the public library.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'The passage says the fort was in the living room. Not the bedroom, the yard, or the library.',
    }],
  },
  {
    code: 'read-rc-p08', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: "Turtles carry their homes on their backs. A turtle's shell is part of its body and cannot come off. When a turtle feels scared, it pulls its head and legs inside the shell to stay safe.",
    items: [{
      slot: 10, difficulty: 'medium', stem: 'Why does a turtle pull into its shell when it is scared?',
      choices: [
        { text: 'The hard shell protects its head and legs from danger.', is_correct: true },
        { text: 'It is trying to go to sleep.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'The shell comes off whenever it is scared.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'It wants to look bigger to other animals.', is_correct: false, misconception_token: 'unsupported-inference' },
      ],
      solution: 'The turtle hides inside its hard shell to stay safe from danger. It is not sleeping, the shell cannot come off, and looking bigger is never mentioned.',
    }],
  },
  {
    code: 'read-rc-p09', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Rain is part of the water cycle. The sun heats water in lakes and oceans, and the water rises into the air as an invisible gas. High up, the gas cools and forms clouds. When the clouds get heavy with water, the water falls back down as rain.',
    items: [
      {
        slot: 11, difficulty: 'medium', stem: 'According to the passage, what happens right before clouds form?',
        choices: [
          { text: 'Water rises into the air and cools high up.', is_correct: true },
          { text: 'Rain falls down to the ground.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'The sun stops shining.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'The lakes and oceans dry up completely.', is_correct: false, misconception_token: 'too-broad' },
        ],
        solution: 'Clouds form after water rises and cools high up, so that comes right before. Rain comes after clouds, the sun keeps heating the water, and the lakes do not dry up completely.',
      },
      {
        slot: 12, difficulty: 'hard', stem: 'Why does it rain when there is a lot of water in the clouds?',
        choices: [
          { text: 'The clouds get too heavy to hold the water up, so it falls.', is_correct: true },
          { text: 'The clouds are made of soft cotton.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'The falling rain is what makes the clouds heavy.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'The sun reaches down and pushes the rain out.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution: 'The passage says clouds rain when they get heavy with water, so they let go once they are too heavy to hold it up. Clouds are not cotton, rain comes from heavy clouds (not the reverse), and the sun heating water is not the same as pushing rain down.',
      },
    ],
  },
  {
    code: 'read-rc-p10', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Bees are important helpers for flowers. When a bee lands on a flower to drink its sweet nectar, yellow dust called pollen sticks to its body. The bee carries the pollen to the next flower, which helps new flowers and fruits grow.',
    items: [{
      slot: 13, difficulty: 'medium', stem: 'How do bees help flowers?',
      choices: [
        { text: 'They carry pollen from one flower to another.', is_correct: true },
        { text: "They drink up all of a flower's nectar so it can rest.", is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'They eat the pollen right off the flowers.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'They water the flowers each morning.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Bees carry pollen between flowers, helping new flowers and fruits grow. They do not help by drinking all the nectar, they carry pollen (not eat it), and they do not water flowers.',
    }],
  },
  {
    code: 'read-rc-p11', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Leo\'s family moved to a new town over the summer. On the first day of school, he did not know anyone and sat alone at lunch. A girl named Priya waved him over to her table and introduced him to her friends. By the end of the day, Leo felt much better.',
    items: [{
      slot: 14, difficulty: 'medium', stem: 'Why does Leo feel better by the end of the day?',
      choices: [
        { text: 'He was welcomed and made new friends.', is_correct: true },
        { text: 'He decided to move back to his old town.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'School ended early that day.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'He found his old friends at the new school.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'Priya welcomed Leo and introduced him to friends, so he felt better. He did not move back, the school day did not end early, and his old friends are not at the new school.',
    }],
  },
  {
    code: 'read-rc-p12', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Camels are built for the desert. They can go many days without drinking water. The humps on their backs store fat, not water, which their bodies use for energy when food is hard to find. Their wide feet keep them from sinking into the soft sand.',
    items: [
      {
        slot: 15, difficulty: 'medium', stem: "What do a camel's humps store?",
        choices: [
          { text: "Fat that the camel's body uses for energy.", is_correct: true },
          { text: 'Water for the camel to drink later.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Sand from the desert floor.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'Food that the camel finds along the way.', is_correct: false, misconception_token: 'partly-right' },
        ],
        solution: 'The humps store fat for energy, not water. They do not hold water, sand, or food — the stored fat is what the body uses when food is scarce.',
      },
      {
        slot: 16, difficulty: 'hard', stem: 'Why are wide feet helpful for a camel in the desert?',
        choices: [
          { text: 'They keep the camel from sinking into the soft sand.', is_correct: true },
          { text: 'They help the camel store even more water.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'They make the camel run faster than any other animal.', is_correct: false, misconception_token: 'too-broad' },
          { text: 'They keep the camel warm at night.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: 'Wide feet stop the camel from sinking into soft sand. They do not store water, are not said to make it the fastest animal, and warmth is not mentioned.',
      },
    ],
  },
  {
    code: 'read-rc-p13', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: "A young kangaroo is called a joey. When a joey is born, it is very tiny. It crawls into a pouch on its mother's belly, where it stays warm and safe and drinks milk until it is big enough to hop around on its own.",
    items: [{
      slot: 17, difficulty: 'easy', stem: 'Where does a baby kangaroo stay after it is born?',
      choices: [
        { text: "In a pouch on its mother's belly.", is_correct: true },
        { text: 'In a nest up in a tree.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: "On its mother's back.", is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Hopping around on its own right away.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: "The joey stays in a pouch on its mother's belly. Not a tree nest or its mother's back, and it cannot hop on its own until it is bigger.",
    }],
  },
  {
    code: 'read-rc-p14', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Thunder and lightning happen at the same time during a storm. But we usually see the lightning first and hear the thunder a few seconds later. That is because light travels to our eyes much faster than sound travels to our ears.',
    items: [{
      slot: 18, difficulty: 'hard', stem: 'Why do we see lightning before we hear thunder?',
      choices: [
        { text: 'Light travels faster than sound.', is_correct: true },
        { text: 'The thunder happens long after the lightning.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Thunder is quieter than lightning is bright.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'We are standing closer to the lightning than to the thunder.', is_correct: false, misconception_token: 'unsupported-inference' },
      ],
      solution: 'We see lightning first because light travels faster than sound. Thunder happens at the same time (not long after), loudness versus brightness is not the reason, and lightning and thunder come from the same place.',
    }],
  },
  {
    code: 'read-rc-p15', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Ice is lighter than the water it forms from. That is why ice cubes float in a glass instead of sinking. In lakes, this means ice forms on the top in winter, while the water underneath stays liquid, so fish can still swim below the ice.',
    items: [{
      slot: 19, difficulty: 'medium', stem: 'Why can fish survive in a lake during winter?',
      choices: [
        { text: 'Ice floats on top, so the water beneath it stays liquid.', is_correct: true },
        { text: 'The fish freeze into the ice and thaw out in spring.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'The whole lake turns into solid ice.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'The fish breathe the ice as if it were air.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Because ice floats, the water below stays liquid and fish can swim. The fish do not freeze and thaw, the whole lake does not freeze solid, and fish do not breathe ice.',
    }],
  },
  {
    code: 'read-rc-p16', skillSlug: 'reading-comprehension', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Nadia wanted to save money for a bicycle. Each week she put half of her allowance into a jar and spent the rest. It took her many months, but the jar slowly filled with coins and bills. On her birthday, she finally counted enough to buy the bike she wanted.',
    items: [{
      slot: 20, difficulty: 'hard', stem: "What is the main lesson of Nadia's story?",
      choices: [
        { text: 'Saving a little at a time can add up to something big.', is_correct: true },
        { text: 'You should never spend any of your money.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'Bicycles cost too much for anyone to buy.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Birthdays are the best time to get gifts.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Nadia saved half her allowance over months until she could buy the bike — saving a little adds up. She still spent some money, the bike was not unaffordable, and the lesson is not about birthdays.',
    }],
  },
]

// ============================================================================
// Story Elements (3-5) — SAT "Information and Ideas" (narrative craft):
// character, setting, problem/solution, feelings, and theme in short original
// stories. 16 passages, 20 questions (four back two each), 8 easy / 8 medium / 4 hard.
// ============================================================================

const STORY_ELEMENTS_PASSAGES: ReadingPassage[] = [
  {
    code: 'read-se-p01', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'It was a rainy Saturday, so Ella and her little brother built a blanket fort in the living room. They filled it with pillows and a flashlight. All afternoon they told stories inside their cozy hideout while the rain tapped on the windows.',
    items: [{
      slot: 1, difficulty: 'easy', stem: 'Where does this story take place?',
      choices: [
        { text: 'In the living room.', is_correct: true },
        { text: 'At school.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'Outside in the rain.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'In a real cave.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'The story happens in the living room, where they built the fort. Not at school, outside, or a real cave — the rain is outside the window.',
    }],
  },
  {
    code: 'read-se-p02', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Theo could not find his other shoe anywhere. He looked under his bed and in the closet, but it was gone. Finally, he checked by the back door and found the shoe — his puppy had carried it there to chew.',
    items: [{
      slot: 2, difficulty: 'easy', stem: 'What is the problem in the story?',
      choices: [
        { text: 'Theo cannot find his other shoe.', is_correct: true },
        { text: 'His puppy has run away and is lost.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Theo is going to be late for school.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'Theo has far too many shoes.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: 'The problem is the missing shoe. His puppy is not lost, he is not late for school, and he does not have too many shoes — he is missing one.',
    }],
  },
  {
    code: 'read-se-p03', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Rosa entered the school art contest, but she was sure her painting was not good enough. Her hands shook as the judges walked by. When they announced that her painting had won first place, Rosa could hardly believe it. She grinned from ear to ear.',
    items: [
      {
        slot: 3, difficulty: 'easy', stem: 'How does Rosa feel at the beginning of the story?',
        choices: [
          { text: 'Nervous and unsure of herself.', is_correct: true },
          { text: 'Bored and sleepy.', is_correct: false, misconception_token: 'misreads-tone' },
          { text: 'Angry at the judges.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Proud and confident.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: 'At the start, her shaking hands and doubt show Rosa is nervous and unsure. She is not bored, angry, or confident — that comes later.',
      },
      {
        slot: 4, difficulty: 'medium', stem: 'How do Rosa\'s feelings change by the end of the story?',
        choices: [
          { text: 'She goes from nervous to happy and proud.', is_correct: true },
          { text: 'She goes from happy to disappointed.', is_correct: false, misconception_token: 'reverses-relationship' },
          { text: 'She stays just as nervous the whole time.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'She becomes angry that she won.', is_correct: false, misconception_token: 'misreads-tone' },
        ],
        solution: 'Rosa starts nervous and ends grinning after winning, so she moves from nervous to happy and proud. It is not the reverse, she does not stay nervous, and she is glad (not angry) to win.',
      },
    ],
  },
  {
    code: 'read-se-p04', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Deep in the forest, an old fox had dug a cozy den beneath the roots of a giant oak tree. Snow fell softly outside, but inside the den it was warm and dry. The fox curled up and went to sleep.',
    items: [{
      slot: 5, difficulty: 'easy', stem: 'Where does the fox live?',
      choices: [
        { text: 'In a den beneath an oak tree in the forest.', is_correct: true },
        { text: 'In a warm house with a family.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: "On top of the oak tree's branches.", is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'In a cave beside the ocean.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'The fox lives in a den beneath the roots of an oak tree in the forest. Not in a house, up in the branches, or by the ocean.',
    }],
  },
  {
    code: 'read-se-p05', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Kwame really wanted to ride the tall roller coaster, but he was one inch too short. Instead of being upset, he spent the day on the smaller rides with his cousins and had a great time. Next year, he promised himself, he would be tall enough.',
    items: [{
      slot: 6, difficulty: 'easy', stem: 'What kind of person is Kwame, based on the story?',
      choices: [
        { text: 'He makes the best of things instead of staying upset.', is_correct: true },
        { text: 'He gives up on having any fun at all.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'He is mean to his cousins.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'He is scared of every ride at the park.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Kwame chooses to enjoy the smaller rides instead of sulking, so he makes the best of things. He does not give up on fun, is not mean, and is not scared of the rides.',
    }],
  },
  {
    code: 'read-se-p06', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The little sailboat had drifted far from shore, and dark clouds were rolling in. Captain Lin gripped the wheel and steered straight toward a small island she spotted in the distance. Just as the first raindrops fell, she guided the boat safely into a calm cove.',
    items: [
      {
        slot: 7, difficulty: 'medium', stem: 'What problem does Captain Lin face?',
        choices: [
          { text: 'A storm is coming while her boat is far from shore.', is_correct: true },
          { text: 'Her boat has run out of food.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'She cannot find the ocean.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'The island she sees is sinking.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: 'Captain Lin\'s problem is the coming storm with her boat far out. There is no mention of running out of food, she is already on the ocean, and the island is not sinking.',
      },
      {
        slot: 8, difficulty: 'medium', stem: 'How does Captain Lin solve her problem?',
        choices: [
          { text: 'She steers to a nearby island and reaches a calm cove.', is_correct: true },
          { text: 'She jumps into the water and swims to shore.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'She waits for someone else to come rescue her.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'She sails farther out into the open sea.', is_correct: false, misconception_token: 'reverses-relationship' },
        ],
        solution: 'She steers toward the island and into a calm cove before the storm. She does not swim, wait for rescue, or sail farther out — she heads to safety.',
      },
    ],
  },
  {
    code: 'read-se-p07', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: "Grandma's kitchen always smelled like cinnamon. Every Sunday, Amir would sit at the wooden table and watch her roll dough for her famous rolls. She would hum an old song, and Amir would wait for the first warm roll straight from the oven.",
    items: [{
      slot: 9, difficulty: 'easy', stem: 'Where does this story take place?',
      choices: [
        { text: "In Grandma's kitchen.", is_correct: true },
        { text: 'At a bakery in town.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: "In Amir's classroom.", is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Outdoors in a garden.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: "The story is set in Grandma's kitchen at her wooden table. Not a bakery, a classroom, or a garden.",
    }],
  },
  {
    code: 'read-se-p08', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Jonah promised to feed the class hamster over the long weekend, but on Saturday he completely forgot. On Sunday, he suddenly remembered and felt terrible. He rushed to school with his mom, gave the hamster food and water, and decided to write himself a note next time.',
    items: [{
      slot: 10, difficulty: 'medium', stem: 'What does Jonah learn in the story?',
      choices: [
        { text: 'He should find a way to remember his responsibilities.', is_correct: true },
        { text: 'He should never take care of any animal again.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'It is perfectly fine to break a promise.', is_correct: false, misconception_token: 'reverses-relationship' },
        { text: 'His mom should do all of his chores for him.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Jonah decides to write a note so he will not forget again — he learns to remember his responsibilities. He does not swear off animals, does not think breaking promises is fine, and does not hand his chores to his mom.',
    }],
  },
  {
    code: 'read-se-p09', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The dragon in the story was not fierce at all. He lived alone on a mountain because the villagers were afraid of his fiery sneezes. One day, a brave girl climbed up to meet him and discovered he was gentle and lonely. She invited him to the village, and soon the children loved his warm, crackly laugh.',
    items: [
      {
        slot: 11, difficulty: 'medium', stem: 'What is the dragon really like?',
        choices: [
          { text: 'Gentle and lonely, not fierce.', is_correct: true },
          { text: 'Cruel and dangerous to everyone.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Loud and rude to the girl who visits.', is_correct: false, misconception_token: 'plausible-but-unstated' },
          { text: 'Too shy to ever leave his mountain.', is_correct: false, misconception_token: 'partly-right' },
        ],
        solution: 'The dragon turns out to be gentle and lonely, not fierce. He is not cruel or rude, and while he lived alone, he does leave the mountain when invited, so "too shy to ever leave" is only partly right.',
      },
      {
        slot: 12, difficulty: 'hard', stem: 'What lesson does this story teach?',
        choices: [
          { text: 'Someone who seems scary may turn out to be kind.', is_correct: true },
          { text: 'Dragons make good pets.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'You should always stay away from anyone new.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Living high on a mountain is dangerous.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution: 'The scary-seeming dragon is really kind, so the lesson is not to judge by fear. It is not about pets, it rewards the girl for reaching out (not avoiding others), and mountain danger is not the point.',
      },
    ],
  },
  {
    code: 'read-se-p10', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Mia\'s kite was stuck high in a tree. She could not reach it, no matter how she jumped. Her older brother had an idea: he tied a rope to a tennis ball, threw it over the branch, and gently shook the kite loose.',
    items: [{
      slot: 13, difficulty: 'medium', stem: 'How is the problem in the story solved?',
      choices: [
        { text: 'Her brother uses a rope and a ball to shake the kite loose.', is_correct: true },
        { text: 'Mia climbs the tree and grabs the kite herself.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'The wind blows the kite down all on its own.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'Mia buys a brand-new kite instead.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'Her brother\'s rope-and-ball trick shakes the kite loose — that solves it. Mia does not climb up, the wind does not free it, and she does not buy a new one.',
    }],
  },
  {
    code: 'read-se-p11', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The morning of the big game, dark clouds filled the sky. By the time the teams lined up, rain was pouring down. The players slipped and slid across the muddy field, laughing as they chased the ball through the puddles.',
    items: [{
      slot: 14, difficulty: 'easy', stem: 'What is the weather like during the game?',
      choices: [
        { text: 'Rainy and wet.', is_correct: true },
        { text: 'Sunny and hot.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Cold and snowy.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        { text: 'So foggy that no one can see.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'It is rainy and wet — the field is muddy and full of puddles. It is not sunny, snowy, or too foggy to see.',
    }],
  },
  {
    code: 'read-se-p12', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Sanjay had practiced his speech a hundred times, but standing in front of the whole school, he froze. The silence felt endless. Then he took a deep breath, remembered his first line, and the words began to flow. When he finished, the crowd clapped loudly, and Sanjay let out a huge sigh of relief.',
    items: [
      {
        slot: 15, difficulty: 'medium', stem: 'How does Sanjay feel when he first stands up to speak?',
        choices: [
          { text: 'Frozen with fear.', is_correct: true },
          { text: 'Calm and relaxed.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Excited to show off.', is_correct: false, misconception_token: 'misreads-tone' },
          { text: 'Angry at the crowd.', is_correct: false, misconception_token: 'plausible-but-unstated' },
        ],
        solution: 'Sanjay freezes and the silence feels endless, so he is afraid at first. He is not calm, showing off, or angry — relief comes only at the end.',
      },
      {
        slot: 16, difficulty: 'hard', stem: 'What is the turning point of the story?',
        choices: [
          { text: 'Sanjay takes a deep breath and remembers his first line.', is_correct: true },
          { text: 'Sanjay walks off the stage without speaking.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'Sanjay decides never to give a speech again.', is_correct: false, misconception_token: 'unsupported-inference' },
          { text: 'The principal reads the speech for him.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: 'The turning point is when Sanjay breathes and remembers his first line, and the words flow. He does not walk off, the story does not say he quits speeches, and no one reads it for him.',
      },
    ],
  },
  {
    code: 'read-se-p13', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'The town of Willow Creek sat in a quiet valley between two green hills. A narrow river ran right through the middle, and a small wooden bridge connected the two sides. Every morning, farmers crossed the bridge to sell fruit in the market square.',
    items: [{
      slot: 17, difficulty: 'easy', stem: 'Which detail best describes the setting of the story?',
      choices: [
        { text: 'A quiet valley town with a river and a wooden bridge.', is_correct: true },
        { text: 'A busy city full of tall buildings.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'A sandy beach beside the sea.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'A town where no one ever leaves home.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'Willow Creek is a quiet valley town with a river and a wooden bridge. It is not a big city or a beach, and farmers do leave home to cross to the market.',
    }],
  },
  {
    code: 'read-se-p14', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'Every day after school, Lila visited the old man who lived next door and read the newspaper to him because his eyes were weak. She never asked for anything in return. On the last day of summer, he surprised her with a small painting he had made just for her.',
    items: [{
      slot: 18, difficulty: 'hard', stem: 'What does the story mainly show about Lila?',
      choices: [
        { text: 'She is kind and helps others without expecting a reward.', is_correct: true },
        { text: 'She only helps people who pay her.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: "She wants the old man's painting from the very start.", is_correct: false, misconception_token: 'unsupported-inference' },
        { text: 'She dislikes reading out loud.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: 'Lila reads to her neighbor daily and asks for nothing, so she is kind and giving. She does not require payment, and she does not start out wanting the painting — it is a surprise.',
    }],
  },
  {
    code: 'read-se-p15', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: "Owen's family was moving to a new house, and he had to say goodbye to his best friend, Kai. On moving day, Owen felt a lump in his throat. Kai handed him a friendship bracelet and promised they would still visit. Owen managed a small smile as the car pulled away.",
    items: [{
      slot: 19, difficulty: 'medium', stem: 'How does Owen most likely feel on moving day?',
      choices: [
        { text: 'Sad to leave, but comforted by his friend.', is_correct: true },
        { text: 'Thrilled that he is finally moving away.', is_correct: false, misconception_token: 'misreads-tone' },
        { text: 'Completely bored by the whole day.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Angry at Kai for the bracelet.', is_correct: false, misconception_token: 'plausible-but-unstated' },
      ],
      solution: "Owen's lump in his throat shows sadness, and Kai's bracelet and his small smile show some comfort. He is not thrilled, bored, or angry at Kai.",
    }],
  },
  {
    code: 'read-se-p16', skillSlug: 'story-elements', satAlignment: 'information-and-ideas', gradeBand: '3-5',
    body: 'In the story, a greedy king demanded that everything he touched turn to gold. At first he was delighted as coins and crowns piled up. But when he could no longer eat, because even his food turned hard and gold, he begged to have his wish taken away.',
    items: [{
      slot: 20, difficulty: 'hard', stem: 'What is the main lesson of this story?',
      choices: [
        { text: 'Wanting too much can end up causing harm.', is_correct: true },
        { text: 'Gold is the most useful thing anyone can own.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'Kings are always unhappy people.', is_correct: false, misconception_token: 'too-broad' },
        { text: 'It is good to be able to touch things.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: 'The king\'s greed for gold leaves him unable to eat, so the lesson is that wanting too much can backfire. Gold is not shown as most useful, the story is not about all kings, and it is not about touching in general.',
    }],
  },
]

// ============================================================================
// Vocabulary (3-5) — SAT "Craft and Structure": words in context. Each short
// passage uses a target word; the question asks its meaning AS USED. 16 passages,
// 20 questions (four back two each), 8 easy / 8 medium / 4 hard.
// ============================================================================

const VOCABULARY_PASSAGES: ReadingPassage[] = [
  {
    code: 'read-vo-p01', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The old bridge was so fragile that the workers put up a fence to keep people off it. Even a small push could make its rotten boards crack and fall.',
    items: [{
      slot: 1, difficulty: 'easy', stem: "As used in the passage, 'fragile' most nearly means",
      choices: [
        { text: 'easily broken.', is_correct: true },
        { text: 'very heavy.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'brightly colored.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'strong and safe.', is_correct: false, misconception_token: 'contradicts-text' },
      ],
      solution: "The bridge could crack from a small push, so 'fragile' means easily broken. It does not mean heavy or colorful, and 'strong and safe' is the opposite.",
    }],
  },
  {
    code: 'read-vo-p02', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'After the long hike, the travelers were weary. Their legs ached and their eyes drooped, so they stopped to rest under a shady tree.',
    items: [{
      slot: 2, difficulty: 'easy', stem: "As used in the passage, 'weary' most nearly means",
      choices: [
        { text: 'very tired.', is_correct: true },
        { text: 'full of energy.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'hungry.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'lost.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "Aching legs and drooping eyes show 'weary' means very tired. It is not full of energy (the opposite), hungry, or lost.",
    }],
  },
  {
    code: 'read-vo-p03', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The scientist made a keen observation that no one else had noticed: the plants near the light grew twice as fast. Her sharp eye and careful notes led to an important discovery.',
    items: [
      {
        slot: 3, difficulty: 'medium', stem: "As used in the passage, 'keen' most nearly means",
        choices: [
          { text: 'sharp and quick to notice.', is_correct: true },
          { text: 'dull and slow.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'very loud.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'eager to leave.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        ],
        solution: "Her sharp eye caught what others missed, so 'keen' means sharp and quick to notice. It is not dull (the opposite) or loud, and the 'eager' meaning of keen does not fit here.",
      },
      {
        slot: 4, difficulty: 'easy', stem: "As used in the passage, 'observation' most nearly means",
        choices: [
          { text: 'something noticed by watching closely.', is_correct: true },
          { text: 'a rule that must be followed.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'a loud complaint.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'a wild guess.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: "The observation was what she noticed by watching the plants, so it means something seen by close watching. It is not a rule, a complaint, or a guess — she took careful notes.",
      },
    ],
  },
  {
    code: 'read-vo-p04', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: "The puppy was timid at first, hiding behind its owner's legs whenever a stranger came near. After a few weeks, though, it grew brave enough to greet visitors at the door.",
    items: [{
      slot: 5, difficulty: 'easy', stem: "As used in the passage, 'timid' most nearly means",
      choices: [
        { text: 'shy and easily frightened.', is_correct: true },
        { text: 'bold and friendly.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'hungry.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'playful.', is_correct: false, misconception_token: 'wrong-word-meaning' },
      ],
      solution: "The puppy hid from strangers, so 'timid' means shy and easily frightened. 'Bold and friendly' is the opposite, and hungry and playful do not fit.",
    }],
  },
  {
    code: 'read-vo-p05', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The desert was completely barren. For miles, there were no trees, no grass, and no water — only bare sand stretching to the horizon.',
    items: [{
      slot: 6, difficulty: 'easy', stem: "As used in the passage, 'barren' most nearly means",
      choices: [
        { text: 'empty and bare.', is_correct: true },
        { text: 'crowded with plants.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'cold and icy.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'full of color.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "With no trees, grass, or water, 'barren' means empty and bare. It is the opposite of full of plants, and it does not mean icy or colorful.",
    }],
  },
  {
    code: 'read-vo-p06', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: "The coach urged the tired runners to keep going. 'Just one more lap,' she called, encouraging them until they crossed the finish line. Her steady voice pushed them forward when they wanted to quit.",
    items: [
      {
        slot: 7, difficulty: 'medium', stem: "As used in the passage, 'urged' most nearly means",
        choices: [
          { text: 'strongly encouraged.', is_correct: true },
          { text: 'quietly ignored.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'gently carried.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'carefully measured.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "The coach pushed the runners to keep going, so 'urged' means strongly encouraged. She did not ignore them, carry them, or measure them.",
      },
      {
        slot: 8, difficulty: 'medium', stem: "As used in the passage, 'steady' most nearly means",
        choices: [
          { text: 'calm and constant.', is_correct: true },
          { text: 'shaking and weak.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'extremely loud.', is_correct: false, misconception_token: 'partly-right' },
          { text: 'brand new.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "Her steady voice kept the runners going, so 'steady' means calm and constant. It is not shaking, it describes constancy rather than loudness, and it has nothing to do with being new.",
      },
    ],
  },
  {
    code: 'read-vo-p07', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: "The instructions were so vague that no one knew what to do. They didn't say how much water to add or how long to wait, so everyone just guessed.",
    items: [{
      slot: 9, difficulty: 'easy', stem: "As used in the passage, 'vague' most nearly means",
      choices: [
        { text: 'unclear.', is_correct: true },
        { text: 'very detailed.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'colorful.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'loud.', is_correct: false, misconception_token: 'wrong-word-meaning' },
      ],
      solution: "The instructions did not say how much or how long, so 'vague' means unclear. It is the opposite of detailed, and it is not about color or sound.",
    }],
  },
  {
    code: 'read-vo-p08', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The tiny stream eventually swelled into a wide, rushing river after weeks of heavy rain. What had been a trickle now roared past the banks.',
    items: [{
      slot: 10, difficulty: 'medium', stem: "As used in the passage, 'swelled' most nearly means",
      choices: [
        { text: 'grew larger.', is_correct: true },
        { text: 'dried up.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'hurt and ached.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'froze solid.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "The stream became a wide river, so 'swelled' means grew larger. It did not dry up (the opposite); the 'ache' meaning of swell and 'froze' do not fit.",
    }],
  },
  {
    code: 'read-vo-p09', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The knight was known for his valor. He rode fearlessly into danger to protect the villagers, never once turning away from a fight that needed him.',
    items: [
      {
        slot: 11, difficulty: 'medium', stem: "As used in the passage, 'valor' most nearly means",
        choices: [
          { text: 'great courage.', is_correct: true },
          { text: 'great fear.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'great wealth.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'great speed.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "The knight rode fearlessly into danger, so 'valor' means great courage. It is the opposite of fear and does not mean wealth or speed.",
      },
      {
        slot: 12, difficulty: 'hard', stem: "As used in the passage, 'fearlessly' most nearly means",
        choices: [
          { text: 'without being afraid.', is_correct: true },
          { text: 'very carefully.', is_correct: false, misconception_token: 'partly-right' },
          { text: 'with great fear.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'very quietly.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "'Fearlessly' means without being afraid, matching the knight's valor. Careful is not the meaning, 'with great fear' is the opposite, and 'quietly' does not fit.",
      },
    ],
  },
  {
    code: 'read-vo-p10', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The soup was bland, so Grandpa added salt, pepper, and a squeeze of lemon. With a little more flavor, it tasted much better.',
    items: [{
      slot: 13, difficulty: 'medium', stem: "As used in the passage, 'bland' most nearly means",
      choices: [
        { text: 'having little flavor.', is_correct: true },
        { text: 'much too spicy.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'very hot in temperature.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'frozen.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "Grandpa added flavor because the soup was bland, so it means having little flavor. It is the opposite of spicy, and it is not about temperature or being frozen.",
    }],
  },
  {
    code: 'read-vo-p11', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The crowd was enormous. So many people had come to the parade that they filled the streets and sidewalks for blocks in every direction.',
    items: [{
      slot: 14, difficulty: 'medium', stem: "As used in the passage, 'enormous' most nearly means",
      choices: [
        { text: 'very large.', is_correct: true },
        { text: 'very small.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'very quiet.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'very old.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "The crowd filled the streets for blocks, so 'enormous' means very large. It is the opposite of small and does not mean quiet or old.",
    }],
  },
  {
    code: 'read-vo-p12', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The detective was persistent. Even when every clue led to a dead end, he refused to give up, returning to the case night after night until he finally solved it.',
    items: [
      {
        slot: 15, difficulty: 'medium', stem: "As used in the passage, 'persistent' most nearly means",
        choices: [
          { text: 'refusing to give up.', is_correct: true },
          { text: 'quick to quit.', is_correct: false, misconception_token: 'contradicts-text' },
          { text: 'very forgetful.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'friendly.', is_correct: false, misconception_token: 'out-of-scope' },
        ],
        solution: "The detective kept working night after night, so 'persistent' means refusing to give up. It is the opposite of quitting and does not mean forgetful or friendly.",
      },
      {
        slot: 16, difficulty: 'hard', stem: "As used in the passage, the phrase 'dead end' most nearly means",
        choices: [
          { text: 'a point where there is no way forward.', is_correct: true },
          { text: 'the death of a person.', is_correct: false, misconception_token: 'wrong-word-meaning' },
          { text: 'the end of a rope.', is_correct: false, misconception_token: 'out-of-scope' },
          { text: 'an easy path straight to the answer.', is_correct: false, misconception_token: 'contradicts-text' },
        ],
        solution: "Clues leading to a 'dead end' means they went nowhere — no way forward. It does not refer to a real death or a rope, and it is the opposite of an easy path.",
      },
    ],
  },
  {
    code: 'read-vo-p13', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The gift was generous. Aunt Rosa gave far more than anyone expected, filling the whole table with presents for the children.',
    items: [{
      slot: 17, difficulty: 'easy', stem: "As used in the passage, 'generous' most nearly means",
      choices: [
        { text: 'giving a lot.', is_correct: true },
        { text: 'giving very little.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'very colorful.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'very tiny.', is_correct: false, misconception_token: 'wrong-word-meaning' },
      ],
      solution: "Aunt Rosa gave more than expected, so 'generous' means giving a lot. It is the opposite of giving little, and it is not about color or size.",
    }],
  },
  {
    code: 'read-vo-p14', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The hikers were cautious as they crossed the icy path. They tested each step and held the railing tightly so they would not slip.',
    items: [{
      slot: 18, difficulty: 'hard', stem: "As used in the passage, 'cautious' most nearly means",
      choices: [
        { text: 'careful to avoid danger.', is_correct: true },
        { text: 'careless and rushed.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'excited and cheerful.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'curious about the ice.', is_correct: false, misconception_token: 'partly-right' },
      ],
      solution: "Testing each step and holding the railing shows 'cautious' means careful to avoid danger. It is the opposite of careless, is not about being cheerful, and means careful rather than merely curious.",
    }],
  },
  {
    code: 'read-vo-p15', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: 'The room was spotless. Not a single crumb or speck of dust could be seen anywhere, because Dad had cleaned all morning.',
    items: [{
      slot: 19, difficulty: 'easy', stem: "As used in the passage, 'spotless' most nearly means",
      choices: [
        { text: 'perfectly clean.', is_correct: true },
        { text: 'covered in spots.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'brightly painted.', is_correct: false, misconception_token: 'wrong-word-meaning' },
        { text: 'very large.', is_correct: false, misconception_token: 'out-of-scope' },
      ],
      solution: "No crumb or speck of dust was left, so 'spotless' means perfectly clean. It is not covered in spots (the opposite), painted, or large.",
    }],
  },
  {
    code: 'read-vo-p16', skillSlug: 'vocabulary', satAlignment: 'craft-and-structure', gradeBand: '3-5',
    body: "The teacher's praise was sincere. She truly meant every word when she told the class how proud she was of their hard work, and the students could tell she was not just being polite.",
    items: [{
      slot: 20, difficulty: 'hard', stem: "As used in the passage, 'sincere' most nearly means",
      choices: [
        { text: 'truly meant and honest.', is_correct: true },
        { text: 'fake and pretend.', is_correct: false, misconception_token: 'contradicts-text' },
        { text: 'very quiet.', is_correct: false, misconception_token: 'out-of-scope' },
        { text: 'polite but not really meant.', is_correct: false, misconception_token: 'partly-right' },
      ],
      solution: "She truly meant every word, so 'sincere' means honest and heartfelt. It is the opposite of fake, is not about being quiet, and the passage says she was more than just polite.",
    }],
  },
]

export const READING_PASSAGES: ReadingPassage[] = [
  ...EBR_PASSAGES,
  ...MAIN_IDEA_PASSAGES,
  ...READING_COMP_PASSAGES,
  ...STORY_ELEMENTS_PASSAGES,
  ...VOCABULARY_PASSAGES,
]

// --- Deterministic build of a served question from a curated item ------------

function mulberry32(a: number): () => number {
  return function () {
    a |= 0
    a = (a + 0x6d2b79f5) | 0
    let t = Math.imul(a ^ (a >>> 15), 1 | a)
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

/** Stable per-slot seed so the choice order is fixed (idempotent re-seed). */
export function seedForSlot(slot: number): number {
  return Math.imul(slot, 0x9e3779b1) >>> 0
}

export interface BuiltReadingQuestion {
  stem: string
  choices: ReadingChoice[]
  correct_answer: string
  solution: string
  difficulty: Difficulty
}

/**
 * Build the served question for one curated item: deterministically shuffle the
 * choices (so the correct answer isn't always in the same position) and pull the
 * correct option's text as correct_answer. Pure — same (item, seed) -> identical.
 */
export function buildReadingQuestion(item: ReadingItem, seed: number): BuiltReadingQuestion {
  const rng = mulberry32(seed >>> 0)
  const choices = [...item.choices]
  for (let i = choices.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1))
    ;[choices[i], choices[j]] = [choices[j], choices[i]]
  }
  const correct = choices.find((c) => c.is_correct)
  return {
    stem: item.stem,
    choices,
    correct_answer: correct ? correct.text : '',
    solution: item.solution,
    difficulty: item.difficulty,
  }
}

/** All items for a skill, gathered across its passages (guard tests + seeds). */
export function itemsForSkill(skillSlug: string): ReadingItem[] {
  return READING_PASSAGES.filter((p) => p.skillSlug === skillSlug).flatMap((p) => p.items)
}

/** Distinct reading skill slugs currently in the pool. */
export function readingSkillSlugs(): string[] {
  return [...new Set(READING_PASSAGES.map((p) => p.skillSlug))]
}
