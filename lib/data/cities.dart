List cities = [
  {"id": 0, "name": "Київ"},
  {"id": 1, "name": "Харків"},
  {"id": 2, "name": "Одеса"},
  {"id": 3, "name": "Дніпро"},
  {"id": 4, "name": "Донецьк"},
  {"id": 5, "name": "Запоріжжя"},
  {"id": 6, "name": "Львів"},
  {"id": 7, "name": "Кривий Ріг"},
  {"id": 8, "name": "Миколаїв"},
  {"id": 9, "name": "Маріуполь"},
  {"id": 10, "name": "Луганськ"},
  {"id": 11, "name": "Вінниця"},
  {"id": 12, "name": "Макіївка"},
  {"id": 13, "name": "Севастополь"},
  {"id": 14, "name": "Сімферополь"},
  {"id": 15, "name": "Херсон"},
  {"id": 16, "name": "Полтава"},
  {"id": 17, "name": "Чернігів"},
  {"id": 18, "name": "Черкаси"},
  {"id": 19, "name": "Житомир"},
  {"id": 20, "name": "Суми"},
  {"id": 21, "name": "Хмельницький"},
  {"id": 22, "name": "Чернівці"},
  {"id": 23, "name": "Горлівка"},
  {"id": 24, "name": "Рівне"},
  {"id": 25, "name": "Кам'янське"},
  {"id": 26, "name": "Кропивницький"},
  {"id": 27, "name": "Івано-Франківськ"},
  {"id": 28, "name": "Кременчук"},
  {"id": 29, "name": "Тернопіль"},
  {"id": 30, "name": "Луцьк"},
  {"id": 31, "name": "Біла Церква"},
  {"id": 32, "name": "Краматорськ"},
  {"id": 33, "name": "Мелітополь"},
  {"id": 34, "name": "Керч"},
  {"id": 35, "name": "Нікополь"},
  {"id": 36, "name": "Слов'янськ"},
  {"id": 37, "name": "Ужгород"},
  {"id": 38, "name": "Бердянськ"},
  {"id": 39, "name": "Алчевськ"},
  {"id": 40, "name": "Павлоград"},
  {"id": 41, "name": "Сєвєродонецьк"},
  {"id": 42, "name": "Євпаторія"},
  {"id": 43, "name": "Лисичанськ"},
  {"id": 44, "name": "Кам'янець-Подільський"},
  {"id": 45, "name": "Бровари"},
  {"id": 46, "name": "Конотоп"},
  {"id": 47, "name": "Умань"},
  {"id": 48, "name": "Мукачево"},
  {"id": 49, "name": "Олександрія"},
  {"id": 50, "name": "Хрустальний"},
  {"id": 51, "name": "Єнакієве"},
  {"id": 52, "name": "Шостка"},
  {"id": 53, "name": "Бердичів"},
  {"id": 54, "name": "Ялта"},
  {"id": 55, "name": "Бахмут"},
  {"id": 56, "name": "Кадіївка"},
  {"id": 57, "name": "Дрогобич"},
  {"id": 58, "name": "Костянтинівка"},
  {"id": 59, "name": "Ніжин"},
  {"id": 60, "name": "Ізмаїл"},
  {"id": 61, "name": "Новомосковськ"},
  {"id": 62, "name": "Феодосія"},
  {"id": 63, "name": "Ковель"},
  {"id": 64, "name": "Сміла"},
  {"id": 65, "name": "Червоноград"},
  {"id": 66, "name": "Калуш"},
  {"id": 67, "name": "Первомайськ"},
  {"id": 68, "name": "Коростень"},
  {"id": 69, "name": "Довжанськ"},
  {"id": 70, "name": "Покровськ"},
  {"id": 71, "name": "Коломия"},
  {"id": 72, "name": "Бориспіль"},
  {"id": 73, "name": "Рубіжне"},
  {"id": 74, "name": "Чорноморськ"},
  {"id": 75, "name": "Стрий"},
  {"id": 76, "name": "Дружківка"},
  {"id": 77, "name": "Харцизьк"},
  {"id": 78, "name": "Прилуки"},
  {"id": 79, "name": "Лозова"},
  {"id": 80, "name": "Чистякове"},
  {"id": 81, "name": "Новоград-Волинський"},
  {"id": 82, "name": "Енергодар"},
  {"id": 83, "name": "Антрацит"},
  {"id": 84, "name": "Нововолинськ"},
  {"id": 85, "name": "Горішні Плавні"},
  {"id": 86, "name": "Ізюм"},
  {"id": 87, "name": "Шахтарськ"},
  {"id": 88, "name": "Білгород-Дністровський"},
  {"id": 89, "name": "Мирноград"},
  {"id": 90, "name": "Охтирка"},
  {"id": 91, "name": "Марганець"},
  {"id": 92, "name": "Фастів"},
  {"id": 93, "name": "Сніжне"},
  {"id": 94, "name": "Нова Каховка"},
  {"id": 95, "name": "Лубни"},
  {"id": 96, "name": "Ровеньки"},
  {"id": 97, "name": "Жовті Води"},
  {"id": 98, "name": "Брянка"},
  {"id": 99, "name": "Світловодськ"},
  {"id": 100, "name": "Ірпінь"},
  {"id": 101, "name": "Сорокине"},
  {"id": 102, "name": "Шепетівка"},
  {"id": 103, "name": "Ромни"},
  {"id": 104, "name": "Вараш"},
  {"id": 105, "name": "Покров"},
  {"id": 106, "name": "Миргород"},
  {"id": 107, "name": "Подільськ"},
  {"id": 108, "name": "Южноукраїнськ"},
  {"id": 109, "name": "Володимир-Волинський"},
  {"id": 110, "name": "Первомайськ"},
  {"id": 111, "name": "Дубно"},
  {"id": 112, "name": "Вишневе"},
  {"id": 113, "name": "Каховка"},
  {"id": 114, "name": "Васильків"},
  {"id": 115, "name": "Нетішин"},
  {"id": 116, "name": "Вознесенськ"},
  {"id": 117, "name": "Славута"},
  {"id": 118, "name": "Ясинувата"},
  {"id": 119, "name": "Джанкой"},
  {"id": 120, "name": "Боярка"},
  {"id": 121, "name": "Жмеринка"},
  {"id": 122, "name": "Старокостянтинів"},
  {"id": 123, "name": "Авдіївка"},
  {"id": 124, "name": "Самбір"},
  {"id": 125, "name": "Борислав"},
  {"id": 126, "name": "Торецьк"},
  {"id": 127, "name": "Глухів"},
  {"id": 128, "name": "Обухів"},
  {"id": 129, "name": "Токмак"},
  {"id": 130, "name": "Чугуїв"},
  {"id": 131, "name": "Могилів-Подільський"},
  {"id": 132, "name": "Южне"},
  {"id": 133, "name": "Костопіль"},
  {"id": 134, "name": "Синельникове"},
  {"id": 135, "name": "Первомайський"},
  {"id": 136, "name": "Добропілля"},
  {"id": 137, "name": "Новояворівськ"},
  {"id": 138, "name": "Буча"},
  {"id": 139, "name": "Красноперекопськ (Яни Капу)"},
  {"id": 140, "name": "Чортків"},
  {"id": 141, "name": "Балаклія"},
  {"id": 142, "name": "Трускавець"},
  {"id": 143, "name": "Куп'янськ"},
  {"id": 144, "name": "Першотравенськ"},
  {"id": 145, "name": "Новий Розділ"},
  {"id": 146, "name": "Тернівка"},
  {"id": 147, "name": "Сарни"},
  {"id": 148, "name": "Хуст"},
  {"id": 149, "name": "Золотоноша"},
  {"id": 150, "name": "Алушта"},
  {"id": 151, "name": "Хмільник"},
  {"id": 152, "name": "Голубівка"},
  {"id": 153, "name": "Хрестівка"},
  {"id": 154, "name": "Переяслав"},
  {"id": 155, "name": "Малин"},
  {"id": 156, "name": "Вишгород"},
  {"id": 157, "name": "Бахчисарай"},
  {"id": 158, "name": "Гайсин"},
  {"id": 159, "name": "Коростишів"},
  {"id": 160, "name": "Лебедин"},
  {"id": 161, "name": "Перевальськ"},
  {"id": 162, "name": "Виноградів"},
  {"id": 163, "name": "Дебальцеве"},
  {"id": 164, "name": "Канів"},
  {"id": 165, "name": "Олешки"},
  {"id": 166, "name": "Славутич"},
  {"id": 167, "name": "Здолбунів"},
  {"id": 168, "name": "Берегове"},
  {"id": 169, "name": "Гадяч"},
  {"id": 170, "name": "Козятин"},
  {"id": 171, "name": "Золочів"},
  {"id": 172, "name": "Селидове"},
  {"id": 173, "name": "Броди"},
  {"id": 174, "name": "Вільногірськ"},
  {"id": 175, "name": "Знам'янка"},
  {"id": 176, "name": "Докучаєвськ"},
  {"id": 177, "name": "Кролевець"},
  {"id": 178, "name": "Саки"},
  {"id": 179, "name": "Волноваха"},
  {"id": 180, "name": "Молодогвардійськ"},
  {"id": 181, "name": "Ладижин"},
  {"id": 182, "name": "Лиман"},
  {"id": 183, "name": "Мерефа"},
  {"id": 184, "name": "Армянськ"},
  {"id": 185, "name": "Надвірна"},
  {"id": 186, "name": "Люботин"},
  {"id": 187, "name": "Попасна"},
  {"id": 188, "name": "Полонне"},
  {"id": 189, "name": "Кременець"},
  {"id": 190, "name": "Сокаль"},
  {"id": 191, "name": "Красноград"},
  {"id": 192, "name": "Тростянець"},
  {"id": 193, "name": "Стебник"},
  {"id": 194, "name": "Суходільськ"},
  {"id": 195, "name": "Долина"},
  {"id": 196, "name": "Кілія"},
  {"id": 197, "name": "Яготин"},
  {"id": 198, "name": "Кремінна"},
  {"id": 199, "name": "Генічеськ"},
  {"id": 200, "name": "Курахове"},
  {"id": 201, "name": "Пологи"},
  {"id": 202, "name": "Красилів"},
  {"id": 203, "name": "Волочиськ"},
  {"id": 204, "name": "Підгородне"},
  {"id": 205, "name": "Долинська"},
  {"id": 206, "name": "Дніпрорудне"},
  {"id": 207, "name": "Рені"},
  {"id": 208, "name": "Калинівка"},
  {"id": 209, "name": "Балта"},
  {"id": 210, "name": "Вовчанськ"},
  {"id": 211, "name": "П'ятихатки"},
  {"id": 212, "name": "Скадовськ"},
  {"id": 213, "name": "Амвросіївка"},
  {"id": 214, "name": "Корсунь-Шевченківський"},
  {"id": 215, "name": "Бахмач"},
  {"id": 216, "name": "Зугрес"},
  {"id": 217, "name": "Бережани"},
  {"id": 218, "name": "Білогірськ"},
  {"id": 219, "name": "Дергачі"},
  {"id": 220, "name": "Сватове"},
  {"id": 221, "name": "Старобільськ"},
  {"id": 222, "name": "Роздільна"},
  {"id": 223, "name": "Лутугине"},
  {"id": 224, "name": "Звенигородка"},
  {"id": 225, "name": "Новоукраїнка"},
  {"id": 226, "name": "Шпола"},
  {"id": 227, "name": "Ватутіне"},
  {"id": 228, "name": "Ізяслав"},
  {"id": 229, "name": "Свалява"},
  {"id": 230, "name": "Богуслав"},
  {"id": 231, "name": "Верхньодніпровськ"},
  {"id": 232, "name": "Городок"},
  {"id": 233, "name": "Білопілля"},
  {"id": 234, "name": "Сквира"},
  {"id": 235, "name": "Березань"},
  {"id": 236, "name": "Винники"},
  {"id": 237, "name": "Овруч"},
  {"id": 238, "name": "Бар"},
  {"id": 239, "name": "Дунаївці"},
  {"id": 240, "name": "Путивль"},
  {"id": 241, "name": "Городок"},
  {"id": 242, "name": "Пирятин"},
  {"id": 243, "name": "Білозерське"},
  {"id": 244, "name": "Красногорівка"},
  {"id": 245, "name": "Тульчин"},
  {"id": 246, "name": "Іловайськ"},
  {"id": 247, "name": "Вільнянськ"},
  {"id": 248, "name": "Українка"},
  {"id": 249, "name": "Острог"},
  {"id": 250, "name": "Богодухів"},
  {"id": 251, "name": "Новий Буг"},
  {"id": 252, "name": "Болград"},
  {"id": 253, "name": "Вознесенівка"},
  {"id": 254, "name": "Миколаївка"},
  {"id": 255, "name": "Судак"},
  {"id": 256, "name": "Бурштин"},
  {"id": 257, "name": "Вугледар"},
  {"id": 258, "name": "Рахів"},
  {"id": 259, "name": "Новогродівка"},
  {"id": 260, "name": "Оріхів"},
  {"id": 261, "name": "Зміїв"},
  {"id": 262, "name": "Гайворон"},
  {"id": 263, "name": "Карлівка"},
  {"id": 264, "name": "Арциз"},
  {"id": 265, "name": "Миколаїв"},
  {"id": 266, "name": "Радомишль"},
  {"id": 267, "name": "Гола Пристань"},
  {"id": 268, "name": "Очаків"},
  {"id": 269, "name": "Ківерці"},
  {"id": 270, "name": "Сторожинець"},
  {"id": 271, "name": "Золоте"},
  {"id": 272, "name": "Апостолове"},
  {"id": 273, "name": "Городище"},
  {"id": 274, "name": "Гуляйполе"},
  {"id": 275, "name": "Тальне"},
  {"id": 276, "name": "Жашків"},
  {"id": 277, "name": "Збараж"},
  {"id": 278, "name": "Носівка"},
  {"id": 279, "name": "Бунге"},
  {"id": 280, "name": "Василівка"},
  {"id": 281, "name": "Зеленодольськ"},
  {"id": 282, "name": "Часів Яр"},
  {"id": 283, "name": "Новгород-Сіверський"},
  {"id": 284, "name": "Кагарлик"},
  {"id": 285, "name": "Теребовля"},
  {"id": 286, "name": "Жовква"},
  {"id": 287, "name": "Хорол"},
  {"id": 288, "name": "Березне"},
  {"id": 289, "name": "Кам'янка-Дніпровська"},
  {"id": 290, "name": "Рожище"},
  {"id": 291, "name": "Тетіїв"},
  {"id": 292, "name": "Петрово-Красносілля"},
  {"id": 293, "name": "Корюківка"},
  {"id": 294, "name": "Бершадь"},
  {"id": 295, "name": "Берислав"},
  {"id": 296, "name": "Яворів"},
  {"id": 297, "name": "Снігурівка"},
  {"id": 298, "name": "Баштанка"},
  {"id": 299, "name": "Бучач"},
  {"id": 300, "name": "Щастя"},
  {"id": 301, "name": "Гнівань"},
  {"id": 302, "name": "Городня"},
  {"id": 303, "name": "Кам'янка"},
  {"id": 304, "name": "Жданівка"},
  {"id": 305, "name": "Нова Одеса"},
  {"id": 306, "name": "Приморськ"},
  {"id": 307, "name": "Камінь-Каширський"},
  {"id": 308, "name": "Мена"},
  {"id": 309, "name": "Узин"},
  {"id": 310, "name": "Світлодарськ"},
  {"id": 311, "name": "Сіверськ"},
  {"id": 312, "name": "Інкерман"},
  {"id": 313, "name": "Біляївка"},
  {"id": 314, "name": "Баранівка"},
  {"id": 315, "name": "Українськ"},
  {"id": 316, "name": "Немирів"},
  {"id": 317, "name": "Миронівка"},
  {"id": 318, "name": "Лохвиця"},
  {"id": 319, "name": "Новоазовськ"},
  {"id": 320, "name": "Боково-Хрустальне"},
  {"id": 321, "name": "Кальміуське"},
  {"id": 322, "name": "Соледар"},
  {"id": 323, "name": "Гірник"},
  {"id": 324, "name": "Новомиргород"},
  {"id": 325, "name": "Сновськ"},
  {"id": 326, "name": "Ічня"},
  {"id": 327, "name": "Соснівка"},
  {"id": 328, "name": "Іллінці"},
  {"id": 329, "name": "Ямпіль"},
  {"id": 330, "name": "Бобровиця"},
  {"id": 331, "name": "Тараща"},
  {"id": 332, "name": "Борщів"},
  {"id": 333, "name": "Щолкіне"},
  {"id": 334, "name": "Жидачів"},
  {"id": 335, "name": "Мала Виска"},
  {"id": 336, "name": "Бобринець"},
  {"id": 337, "name": "Татарбунари"},
  {"id": 338, "name": "Таврійськ"},
  {"id": 339, "name": "Гребінка"},
  {"id": 340, "name": "Христинівка"},
  {"id": 341, "name": "Моспине"},
  {"id": 342, "name": "Кам'янка-Бузька"},
  {"id": 343, "name": "Болехів"},
  {"id": 344, "name": "Новодністровськ"},
  {"id": 345, "name": "Родинське"},
  {"id": 346, "name": "Радивилів"},
  {"id": 347, "name": "Борзна"},
  {"id": 348, "name": "Деражня"},
  {"id": 349, "name": "Любомль"},
  {"id": 350, "name": "Теплодар"},
  {"id": 351, "name": "Олевськ"},
  {"id": 352, "name": "Перещепине"},
  {"id": 353, "name": "Дубляни"},
  {"id": 354, "name": "Снятин"},
  {"id": 355, "name": "Кобеляки"},
  {"id": 356, "name": "Гірське"},
  {"id": 357, "name": "Верхівцеве"},
  {"id": 358, "name": "Глобине"},
  {"id": 359, "name": "Зіньків"},
  {"id": 360, "name": "Ірміно"},
  {"id": 361, "name": "Зимогір'я"},
  {"id": 362, "name": "Мар'їнка"},
  {"id": 363, "name": "Погребище"},
  {"id": 364, "name": "Ходорів"},
  {"id": 365, "name": "Березівка"},
  {"id": 366, "name": "Радехів"},
  {"id": 367, "name": "Хотин"},
  {"id": 368, "name": "Старий Крим"},
  {"id": 369, "name": "Барвінкове"},
  {"id": 370, "name": "Дубровиця"},
  {"id": 371, "name": "Тисмениця"},
  {"id": 372, "name": "Решетилівка"},
  {"id": 373, "name": "Сокиряни"},
  {"id": 374, "name": "Городенка"},
  {"id": 375, "name": "Заліщики"},
  {"id": 376, "name": "Валки"},
  {"id": 377, "name": "Мостиська"},
  {"id": 378, "name": "Чигирин"},
  {"id": 379, "name": "Іршава"},
  {"id": 380, "name": "Пустомити"},
  {"id": 381, "name": "Помічна"},
  {"id": 382, "name": "Горохів"},
  {"id": 383, "name": "Тячів"},
  {"id": 384, "name": "Буринь"},
  {"id": 385, "name": "Чоп"},
  {"id": 386, "name": "Монастирище"},
  {"id": 387, "name": "Андрушівка"},
  {"id": 388, "name": "Тлумач"},
  {"id": 389, "name": "Кодима"},
  {"id": 390, "name": "Ланівці"},
  {"id": 391, "name": "Липовець"},
  {"id": 392, "name": "Білицьке"},
  {"id": 393, "name": "Косів"},
  {"id": 394, "name": "Ананьїв"},
  {"id": 395, "name": "Заводське"},
  {"id": 396, "name": "Алупка"},
  {"id": 397, "name": "Рава-Руська"},
  {"id": 398, "name": "Семенівка"},
  {"id": 399, "name": "Буськ"},
  {"id": 400, "name": "Вилкове"},
  {"id": 401, "name": "Яремче"},
  {"id": 402, "name": "Рогатин"},
  {"id": 403, "name": "Заставна"},
  {"id": 404, "name": "Південне"},
  {"id": 405, "name": "Почаїв"},
  {"id": 406, "name": "Новоселиця"},
  {"id": 407, "name": "Вуглегірськ"},
  {"id": 408, "name": "Новодружеськ"},
  {"id": 409, "name": "Привілля"},
  {"id": 410, "name": "Ржищів"},
  {"id": 411, "name": "Кипуче"},
  {"id": 412, "name": "Ворожба"},
  {"id": 413, "name": "Корець"},
  {"id": 414, "name": "Зоринськ"},
  {"id": 415, "name": "Турка"},
  {"id": 416, "name": "Середина-Буда"},
  {"id": 417, "name": "Хоростків"},
  {"id": 418, "name": "Шаргород"},
  {"id": 419, "name": "Молочанськ"},
  {"id": 420, "name": "Перемишляни"},
  {"id": 421, "name": "Копичинці"},
  {"id": 422, "name": "Зборів"},
  {"id": 423, "name": "Перечин"},
  {"id": 424, "name": "Кіцмань"},
  {"id": 425, "name": "Старий Самбір"},
  {"id": 426, "name": "Олександрівськ"},
  {"id": 427, "name": "Судова Вишня"},
  {"id": 428, "name": "Сколе"},
  {"id": 429, "name": "Остер"},
  {"id": 430, "name": "Галич"},
  {"id": 431, "name": "Великі Мости"},
  {"id": 432, "name": "Благовіщенське"},
  {"id": 433, "name": "Монастириська"},
  {"id": 434, "name": "Моршин"},
  {"id": 435, "name": "Чуднів"},
  {"id": 436, "name": "Залізне"},
  {"id": 437, "name": "Шумськ"},
  {"id": 438, "name": "Рудки"},
  {"id": 439, "name": "Вашківці"},
  {"id": 440, "name": "Дружба"},
  {"id": 441, "name": "Міусинськ"},
  {"id": 442, "name": "Святогірськ"},
  {"id": 443, "name": "Добромиль"},
  {"id": 444, "name": "Алмазна"},
  {"id": 445, "name": "Вижниця"},
  {"id": 446, "name": "Новий Калинів"},
  {"id": 447, "name": "Хирів"},
  {"id": 448, "name": "Скалат"},
  {"id": 449, "name": "Комарно"},
  {"id": 450, "name": "Бібрка"},
  {"id": 451, "name": "Глиняни"},
  {"id": 452, "name": "Підгайці"},
  {"id": 453, "name": "Батурин"},
  {"id": 454, "name": "Менше 2500"},
  {"id": 455, "name": "Белз"},
  {"id": 456, "name": "Устилуг"},
  {"id": 457, "name": "Герца"},
  {"id": 458, "name": "Берестечко"},
  {"id": 459, "name": "Угнів"}
];

findCityByName(String name) {
  return cities.firstWhere((element) => element["name"] == name);
}

findCityById(int id) {
  return cities.firstWhere((element) => element["id"] == id);
}
