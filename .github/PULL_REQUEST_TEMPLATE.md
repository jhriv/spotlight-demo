Fixes #issuenumber ; refs #issuenumber

Present tense short summary (50 characters or less)

More detailed description, if necessary. Try to be as descriptive as you can: even if you think that the PR content is obvious, it may not be obvious to others. Include tracebacks and/or screenshots if helpful, and be sure to call out any bits of the PR that may be work-in-progress.

Description can have multiple paragraphs and you can use code examples inside:

``` yaml
- name: Ensure {{ bashrc }} is present
  stat:
    path: '{{ home }}/{{ bashrc }}'
  register: rc_file
  changed_when: rc_file.stat.exists == false
  notify: Assemble bashrc
```

Changes proposed in this pull request:
*
*
*

@ucsdlib/developers - please review
