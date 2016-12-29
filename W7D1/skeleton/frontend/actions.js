const selectCurrency = (baseCurrency, rates) => ({
  type: "SWITCH_CURRENCY",
  baseCurrency: baseCurrency,
  rates: rates
});

window.selectCurrency = selectCurrency;

export default selectCurrency;
