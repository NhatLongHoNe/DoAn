$("#buy-card").change(function () {
    let value = $('#amount').val();
    let ratio = $('#amount').find(':selected').data('ratio');
    let count = $('#quantity').val();
    $(".sum-ne").text(numberFormat.format(value * (ratio / 100) * count))
});