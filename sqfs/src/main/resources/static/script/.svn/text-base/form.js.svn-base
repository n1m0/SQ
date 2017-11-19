(function ($) {
    $.fn.ndradio = function (options) {
        var defaults = {
            select: true,
            callback: function(str) {}
        };
        var options = $.extend(defaults, options);
        var radionav = document.createElement("div");
        radionav.className = 'radio';
        for (var i = 0; i < this.length; i++) {
            this.eq(i).wrapAll(radionav);
            $(".radio").eq(i).append("<span class='f-fl'>" + this.eq(i).attr('label') + "</span>");
            this.eq(i).parent().on('click', function () {
                $(this).parent().find('i').remove();
                $("input[name='" + $(this).find('input:radio').attr('name') + "']").prop('checked', false).parent().removeClass('active');
                $(this).addClass('active');
                $(this).find('input:radio').prop('checked', true);
                //$("#regform").validate().element($(this).find('input:radio'));
                var str = $(this);
                options.callback(str);
            });
        }
        if (options.select==99999) {
            var firstcheck;
            for (var i = 0; i < this.length; i++) {
                if (this.length == 1) {
                    firstcheck = this.attr('name');
                    $("input[name='" + firstcheck + "']").eq(0).prop('checked', true);
                    $("input[name='" + firstcheck + "']").eq(0).parent().addClass('active');
                } else {
                    firstcheck = $("input:radio").eq(i).attr('name');
                    if (!$("input[name='" + firstcheck + "']").eq(0).prop('checked')) {
                        $("input[name='" + firstcheck + "']").eq(0).prop('checked', true);
                        $("input[name='" + firstcheck + "']").eq(0).parent().addClass('active');
                    }
                }
            }
        } else if(options.select == false) {
            for (var i = 0; i < this.length; i++) {
                if ($("input:radio").eq(i - 1).is(":checked")) {
                    $("input:radio").eq(i - 1).prop('checked', true);
                    $("input:radio").eq(i - 1).parent().addClass('active');
                }
            }
        } else {
            firstcheck = options.select;
            $("input[value='" + firstcheck + "']").prop('checked', true);
                $("input[value='" + firstcheck + "']").parent().addClass('active');
           
        }
    };
})(jQuery);