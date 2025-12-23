import React, {type ReactNode} from 'react';
import clsx from 'clsx';
import Translate from '@docusaurus/Translate';
import type {Props} from '@theme/Admonition/Type/Info';
import AdmonitionLayout from '@theme-original/Admonition/Layout';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFlask } from '@fortawesome/free-solid-svg-icons';

const infimaClassName = 'alert alert--experimental';

const defaultProps = {
  icon: <FontAwesomeIcon icon={faFlask} />,
  title: (
    <Translate
      id="theme.admonition.experimental"
      description="The default label used for the Experimental admonition (:::experimental)">
      experimental
    </Translate>
  ),
  
};

export default function AdmonitionTypeExperimental(props: Props): ReactNode {
  return (
    <AdmonitionLayout
      {...defaultProps}
      {...props}
      className={clsx(infimaClassName, props.className)}>
      {props.children}
    </AdmonitionLayout>
  );
}
