import type {ReactNode} from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>> | undefined;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Easy to Use',
    Svg: null,
    description: (
      <>
        For basic player information query, this library provides simple
        getter functions that return results you can use right away.
      </>
    ),
  },
  {
    title: 'SA:MP 0.3.7-R5 Support',
    Svg: null,
    description: (
      <>
        Supports SA:MP 0.3.7-R5 — avoid downgrading and compromising security for convenience.
      </>
    ),
  },
  {
    title: 'Fresh New Documentation',
    Svg: null,
    description: (
      <>
        No need to go through the huge source code! Use this website to quickly
        find out available functions and how to use them.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      {Svg && (
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      )}
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
