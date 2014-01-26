%w(Начитка Вокал Пародия Рэп).each do |cat|
  OrderCategory.create(name: cat)
end

%w(Детский Подростковый Молодой Взрослый Пожилой Старческий).each do |age|
  AgeType.create(name: age)
end

voice_types = %w(Веселый Иностранный Французский Португальский Информационный
  Народный Романтичный Вокалист Английский Испанский Украинский
  Конферансье Пародист Рэп Игровой Немецкий Итальянский Белорусский
  Клубный Пафосный Сексуальный
  )
voice_types.each { |t| VoiceType.create(name: t)}


