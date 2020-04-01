#ifndef SOUND_H
#define SOUND_H

#include "BaseSound.h"

#include <Result.h>

class Sound : public BaseSound {
    Q_OBJECT
public:
    explicit Sound(QObject* parent = nullptr);

    void resetParams();
    void fromOther(const Sound* other);
    Q_INVOKABLE Result load(const QUrl& url);
    Q_INVOKABLE Result save(const QUrl& url);
    Q_INVOKABLE void resetWith(Sound* other);
    QString name() const override;

    bool hasRealUrl() const override;

    void setUrl(const QUrl& url) override;

    /**
     * Set the name of the sound until it is saved
     */
    void setUnsavedName(const QString& name);
};

Q_DECLARE_METATYPE(Sound*)

#endif // SOUND_H
