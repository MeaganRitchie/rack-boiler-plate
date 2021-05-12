BoardGame.destroy_all

BoardGame.create(
  [
    { name: 'Catan', funness: 11, family: true },
    { name: 'Sorry', funness: 15, family: false },
    { name: 'Risk', funness: -1, family: true }
  ]
)