local newline = require('snippet_utils').newline

return {
  -- normal snippets
  s('main', {
    t('int main(int argc, char* argv[])'),
    newline('{'),
    newline(''),
    i(0),
    newline('}'),
  }),
}, {
  -- auto snippets
  s('fn', {
    i(1, 'void'),
    t(' '),
    i(2, 'func'),
    t('('),
    i(3),
    t(')'),
    newline('{'),
    newline(''),
    i(0),
    newline('}'),
  }),
  s('ifndef', {
    t('#ifndef ' .. string.upper(vim.fn.expand('%:t:r') .. '_h')),
    newline(''),
    t('#define ' .. string.upper(vim.fn.expand('%:t:r') .. '_h')),
    newline(''),
    t('#endif'),
  }),
  s('jniexport', {
    t('JNIEXPORT void JNICALL Java_'),
    i(1, 'Class'),
    t('_'),
    i(2, 'Method'),
    t('(JNIEnv *env, jobject obj) {'),
    newline(''),
    i(0),
    newline(''),
    t('}'),
  })
}
