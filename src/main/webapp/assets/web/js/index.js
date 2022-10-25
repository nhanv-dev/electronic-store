// button event set quantity for product add to cart in Product Card component
$('.button-product-quantity').each((index, element) => {
    const input = $(element).find('input[type=number]')
    $(element).find('button:first-child').click(function () {
        const value = parseInt(input.val()) - 1
        if (value > 0) input.val(value)
    })
    $(element).find('button:last-child').click(function () {
        const value = parseInt(input.val()) + 1
        if (value <= input.attr("max")) input.val(value)
    })
})

$("input[type=number]").change(function () {
    const max = parseInt($(this).attr('max'));
    const min = parseInt($(this).attr('min'));
    if ($(this).val() > max)
        $(this).val(max);
    if ($(this).val() < min)
        $(this).val(min);
});

