(function() {
  'use strict';
  var md = require('markdown-it')({
    // allow HTML tags
    html: true
  });
  
  function renderFootnotes(text) {
    var footnotes = [];
    var reFootnoteContent = /\[\^(\w+)\]: ?([\S\s]+?)(?=\[\^(?:\d+)\]|\n+|$)/g;
    // var reInlineFootnote = /\[\^(\d+)\]\((.+?)\)/g;
    var reFootnoteIndex = /\[\^(\w+)\]/g;
    var html = '';

    var num=0;
    text = text.replace(reFootnoteContent, function(match, index, content) {
      num+=1;
      footnotes.push({
        index: num,
        content: content
      });
      // console.log(num);
      // console.log(index);
      // console.log(content);

    // remove footnote content
    return '';
  });

    num=0;
    text = text.replace(reFootnoteIndex, function(match, index, content) {
      num+=1;
      // console.log(num);
      // console.log(content);
    // replace footnote mark with href
    return '<sup id="fnref:' + num + '"><a href="#fn:' + num + '">[' + num + ']</a></sup>';
  });

  // render footnotes (HTML)
  footnotes.forEach(function(footNote) {
    html += '<li id="fn:' + footNote.index + '">';
    html += '<span style="display: inline-block; vertical-align: top; padding-right: 10px;">[' + footNote.index + ']</span>';
    html += '<span style="display: inline-block; vertical-align: top;">';
    html += md.renderInline(footNote.content.trim());
    html += '</span>';
    html += '<a href="#fnref:' + footNote.index + '" > ↩</a>';
    html += '</li>';
  });
  // add footnotes at the end of the content
  if (footnotes.length) {
    text += '<div id="footnotes">';
    text += '<hr>';
    text += '<div id="footnotelist">';
    text += '<ol style="list-style:none; padding-left: 0;">' + html + '</ol>';
    text += '</div></div>';
  }
  return text;
}

hexo.extend.filter.register('before_post_render', function(data) {
  data.content = renderFootnotes(data.content);
  return data;
});
})();