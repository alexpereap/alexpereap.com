const pagination = require('pagination');

const getPaginator = (page, total, count) => {

  if( page ){
    page = parseInt(page);
  }

  page = isNaN(page) ? 1 : page;

  var boostrapPaginator = new pagination.TemplatePaginator({
    prelink:'/', current: page, rowsPerPage: count,
    totalResult: total, slashSeparator: true,
    template: function(result) {
        var i, len, prelink;
        var html = '';
        prelink = this.preparePreLink(result.prelink);

        if(result.previous) {
          html += '<a class="btn-small-white pagination-back" href="?page='+ result.previous +'">' + this.options.translator('PREVIOUS') + '</a>';
        }

        html += '<ul class="pagination">';
        if(result.pageCount < 2) {
            html += '</ul></div>';
            return html;
        }

        if(result.range.length) {
            for( i = 0, len = result.range.length; i < len; i++) {
                if(result.range[i] === result.current) {
                    html += '<li class="active page-item"><a class="page-link" href="?page='  + result.range[i] + '">' + result.range[i] + '</a></li>';
                } else {
                    html += '<li class="page-item"><a class="page-link" href="?page='  + result.range[i] + '">' + result.range[i] + '</a></li>';
                }
            }
        }

        html += '</ul>';

        if(result.next) {
          html += '<a class="btn-small-white pagination-next" href="?page='+ result.next +'" >' + this.options.translator('NEXT') + '</a>';
        }

        return html;
    }
  });

  return boostrapPaginator.render();
}

//TODO: three dots elipsis on third page box
module.exports = getPaginator;
