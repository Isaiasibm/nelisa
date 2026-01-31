
$(document).ready(function () {

    var $sidebar = $('.sidebar');
    var $body = $('body');

    function isMobile() {
        return $(window).width() <= 768;
    }

    function ensureOverlay() {
        var $ov = $('#menuOverlay');
        if (!$ov.length) {
            $ov = $('<div id="menuOverlay"></div>');
            $body.append($ov);

            $ov.on('click', function () {
                closeMenu();
            });
        }
        return $ov;
    }

    function openMenu() {
        $sidebar.addClass('toggled');
        if (isMobile()) {
            ensureOverlay().addClass('show');
            $body.addClass('menu-open');
        }
    }

    function closeMenu() {
        $sidebar.removeClass('toggled');
        var $ov = $('#menuOverlay');
        if ($ov.length) $ov.removeClass('show');
        $body.removeClass('menu-open');
    }

    function toggleMenu() {
        if ($sidebar.hasClass('toggled')) {
            closeMenu();
        } else {
            openMenu();
        }
    }

    // ✅ ÚNICO handler do botão do menu
    $('.sidebar-toggle').on('click', function (e) {
        e.preventDefault();
        toggleMenu();
    });

    // manter submenu ativo aberto
    var active = $('.sidebar .active');
    if (active.length && active.parent('.collapse').length) {
        var parent = active.parent('.collapse');
        parent.prev('a').attr('aria-expanded', true);
        parent.addClass('show');
    }

    // Ajustar ao redimensionar (estado consistente)
    $(window).on('resize', function () {
        closeMenu(); // fecha sempre ao mudar de tamanho
    });
});



function previewImagem() {
    var imagem = document.querySelector('input[name=imagem_nova').files[0];
    var preview = document.querySelector('#preview-user');

    var reader = new FileReader();
    reader.onloadend = function () {
        preview.src = reader.result;
    };
    if (imagem) {
        reader.readAsDataURL(imagem);
    } else {
        preview.src = "";
    }
}

//Carregar modal define para apagar
$(document).ready(function () {
    $('a[data-confirm]').click(function (ev) {
        var href = $(this).attr('href');
        if (!$('#confirm-delete').length) {
            $('body').append('<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header bg-danger text-white">EXCLUIR ITEM<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body">Tem certeza de que deseja excluir o item selecionado?</div><div class="modal-footer"><button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button><a class="btn btn-danger text-white" id="dataComfirmOK">Apagar</a></div></div></div></div>');
        }
        $('#dataComfirmOK').attr('href', href);
        $('#confirm-delete').modal({show: true});
        return false;
    });
});

//Apresentar tooltip
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
}); 