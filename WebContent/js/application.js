if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(document).ajaxStart(function () {
            $('#spinner').show();
        }).ajaxStop(function () {
            $('#spinner').hide();
        });
    })(jQuery);
}
